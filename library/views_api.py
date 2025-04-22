import io
import os
import time
import uuid
import traceback
from datetime import datetime
from zipfile import ZipFile, ZIP_DEFLATED

from django.http import StreamingHttpResponse
from django.utils import timezone
from django.db import (
    connection,
    transaction,
)
from django.db.models import (
    Q,
    Max,
    Min,
    OuterRef,
    Subquery,
    Prefetch,
    Case,
    When,
    BooleanField,
    F,
)

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import Asset, Author, Commit, Sublayer, Keyword
from .utils.s3_utils import S3Manager
from .utils.zipper import zip_files_from_memory

@api_view(['GET'])
def get_assets(request):
    # Start the timer and capture initial query count
    start_time = time.perf_counter()
    initial_query_count = len(connection.queries)

    try:
        # Get query parameters
        search = request.GET.get('search')
        author = request.GET.get('author')
        checked_in_only = request.GET.get('checkedInOnly') == 'true'
        sort_by = request.GET.get('sortBy', 'updated')

        # Base queryset
        assets = Asset.objects.all().select_related('checkedOutBy')

        # Subquery references for earliest and latest commits
        earliest_commit = Commit.objects.filter(asset=OuterRef('pk')).order_by('timestamp')
        latest_commit   = Commit.objects.filter(asset=OuterRef('pk')).order_by('-timestamp')

        # Annotate with first-author and timestamp info
        assets = assets.annotate(
            first_author_first = Subquery(
                earliest_commit.values('author__firstName')[:1]
            ),
            first_author_last  = Subquery(
                earliest_commit.values('author__lastName')[:1]
            ),
            first_ts  = Subquery(earliest_commit.values('timestamp')[:1]),
            latest_ts = Subquery(latest_commit.values('timestamp')[:1]),
        )

        # Apply search filter
        if search:
            assets = assets.filter(
                Q(assetName__icontains=search) |
                Q(keywordsList__keyword__icontains=search)
            ).distinct()

        # Apply checked-in filter
        if checked_in_only:
            assets = assets.filter(checkedOutBy__isnull=True)

        # Apply author filter
        if author:
            for token in author.split():
                assets = assets.filter(
                    Q(first_author_first__icontains=token) |
                    Q(first_author_last__icontains=token)
                )

        # Apply sorting
        if sort_by == 'name':
            assets = assets.order_by('assetName')
        elif sort_by == 'author':
            assets = assets.order_by('first_author_first', 'first_author_last')
        elif sort_by == 'updated':
            assets = assets.order_by('-latest_ts')
        elif sort_by == 'created':
            assets = assets.order_by('-first_ts')

        # Prefetch commits & sublayers and keywords
        assets = assets.prefetch_related(
            Prefetch(
                'commits',
                queryset=Commit.objects
                    .order_by('timestamp')
                    .select_related('author')
                    .prefetch_related('sublayers'),
                to_attr='all_commits'
            ),
            'keywordsList'
        )

        # Convert to frontend format
        assets_list = []
        s3Manager = S3Manager()
        for asset in assets:
            try:
                # Get first and latest commits from the prefetched 'all_commits' list
                all_commits = asset.all_commits
                first_commit = all_commits[0] if all_commits else None
                latest_commit = all_commits[-1] if all_commits else None

                # Check sublayers in-memory, no extra query
                materials = bool(latest_commit.sublayers.all()) if latest_commit else False

                # Generate the thumbnail URL if needed
                thumbnail_url = (
                    s3Manager.generate_presigned_url(asset.thumbnailKey)
                    if asset.thumbnailKey else None
                )

                assets_list.append({
                    'name': asset.assetName,
                    'thumbnailUrl': thumbnail_url,
                    'version': latest_commit.version if latest_commit else "01.00.00",
                    'creator': (
                        f"{first_commit.author.firstName} {first_commit.author.lastName}"
                        if first_commit and first_commit.author else "Unknown"
                    ),
                    'lastModifiedBy': (
                        f"{latest_commit.author.firstName} {latest_commit.author.lastName}"
                        if latest_commit and latest_commit.author else "Unknown"
                    ),
                    'checkedOutBy': asset.checkedOutBy.pennkey if asset.checkedOutBy else None,
                    'isCheckedOut': asset.checkedOutBy is not None,
                    'materials': materials,
                    'keywords': [k.keyword for k in asset.keywordsList.all()],
                    'description': latest_commit.note if latest_commit else "No description available",
                    'createdAt': first_commit.timestamp.isoformat() if first_commit else None,
                    'updatedAt': latest_commit.timestamp.isoformat() if latest_commit else None,
                })

            except Exception as e:
                print(f"Error processing asset {asset.assetName}: {str(e)}")
                continue

        return Response({'assets': assets_list})

    except Exception as e:
        print(f"Error in get_assets: {str(e)}")
        return Response({'error': str(e)}, status=500)

    finally:
        # -------------------------------
        # Performance logging
        # -------------------------------
        end_time = time.perf_counter()
        elapsed_seconds = end_time - start_time

        final_query_count = len(connection.queries)
        queries_used = final_query_count - initial_query_count

        print(
            f"[PERF DEBUG] get_assets took {elapsed_seconds:.4f} seconds "
            f"and used {queries_used} DB queries."
        )

@api_view(['GET'])
def get_asset(request, asset_name):
    # Start the timer and capture initial query count
    start_time = time.perf_counter()
    initial_query_count = len(connection.queries)

    try:
        # Prefetch ALL commits (with author and sublayers) in one shot
        asset = (
            Asset.objects
                 .select_related('checkedOutBy')
                 .prefetch_related(
                     'keywordsList',
                     Prefetch(
                         'commits',
                         queryset=Commit.objects
                                        .select_related('author')
                                        .prefetch_related('sublayers'),
                         to_attr='all_commits'  # store them in memory under this attribute
                     )
                 )
                 .get(assetName=asset_name)
        )

        # `asset.all_commits` is now a list of Commit objects in memory
        all_commits = asset.all_commits

        # Derive first and latest from that list
        if all_commits:
            first_commit = min(all_commits, key=lambda c: c.timestamp)
            latest_commit = max(all_commits, key=lambda c: c.timestamp)
        else:
            first_commit = None
            latest_commit = None

        s3Manager = S3Manager()
        thumbnail_url = (
            s3Manager.generate_presigned_url(asset.thumbnailKey)
            if asset.thumbnailKey else None
        )

        asset_data = {
            'name': asset.assetName,
            'thumbnailUrl': thumbnail_url,
            'version': latest_commit.version if latest_commit else "01.00.00",
            'creator': (
                f"{first_commit.author.firstName} {first_commit.author.lastName}"
                if first_commit and first_commit.author else "Unknown"
            ),
            'lastModifiedBy': (
                f"{latest_commit.author.firstName} {latest_commit.author.lastName}"
                if latest_commit and latest_commit.author else "Unknown"
            ),
            'checkedOutBy': asset.checkedOutBy.pennkey if asset.checkedOutBy else None,
            'isCheckedOut': asset.checkedOutBy is not None,
            # Because the commits & sublayers are already prefetched, no extra DB calls here
            'materials': bool(latest_commit and latest_commit.sublayers.all()),
            'keywords': [k.keyword for k in asset.keywordsList.all()],
            'description': latest_commit.note if latest_commit else "No description available",
            'createdAt': first_commit.timestamp.isoformat() if first_commit else None,
            'updatedAt': latest_commit.timestamp.isoformat() if latest_commit else None,
        }

        return Response({'asset': asset_data})

    except Asset.DoesNotExist:
        return Response({'error': 'Asset not found'}, status=404)
    except Exception as e:
        return Response({'error': str(e)}, status=500)
    finally:
        # Performance logging
        end_time = time.perf_counter()
        elapsed_seconds = end_time - start_time
        final_query_count = len(connection.queries)
        queries_used = final_query_count - initial_query_count

        print(
            f"[PERF DEBUG] get_asset took {elapsed_seconds:.4f} seconds "
            f"and used {queries_used} DB queries."
        )

@api_view(['POST'])
def post_asset(request, asset_name):
    try:
        # On the frontend, we should first check if metadata exists
        # Metadata upload is a separate POST 

        if Asset.objects.get(assetName=asset_name):
            return Response({'error': 'Asset already exists'}, status=400)

        files = request.FILES.getlist('files')
        if not files:
            return Response({'error': 'Request missing files'}, status=404)

        s3 = S3Manager()
        for file in files:
            s3.upload_file(file, f"{asset_name}/{file.name}")

        return Response({'message': 'Successfully uploaded'}, status=200)
    
    except Exception as e:
        return Response({'error': str(e)}, status=500)

# Query:
#   asset_name - A string as the name of the asset
#   metadata - a JSON containing relevant metadata information
#   metadata 
#   - hasTexture (bool)    
#   - keywords (list of keyword strings)
#   - commit (Object contianing below)
#     - author
#     - timestamp
#     - version
#     - note

@api_view(['POST'])
def post_metadata(request, asset_name):
    try:
        # All untested!

        if Asset.objects.get(assetName=asset_name):
            return Response({'error': 'Asset exists!'}, status=400)

        metadata = request.loads('utf-8')
        asset = Asset(
            id = uuid.uuid4(),
            assetName = asset_name,
            hasTexture = metadata["hasTexture"],
            thumbnailKey = f"{asset_name}/thumbnail.png"
        )

        for keyword in metadata["keywords"]:
            keyword, created = Keyword.objects.get_or_create(keyword=keyword.lower())
            asset.keywordsList.add(keyword)

        author = Author.objects.filter(username=commit["author"]).first()

        if author is None:
            author = Author(username=commit["author"], firstName="", lastName="")
            # DEFAULT PASSWORD set as "password"
            author.set_password("password")
            author.save()
            print(f"Author {commit['author']} not found, created new author.")

        commit = metadata["Commit"]
        commit = Commit(
            author = author, 
            timestamp = datetime.fromisoformat(commit["timestamp"]), 
            version = commit["version"] , 
            note = commit["note"], 
            asset = asset)
        commit.save()

        versions = {
            "Variant Set" : f"{asset_name}/{asset_name}.usda",
            "LOD0" : f"{asset_name}/LODs/{asset_name}_LOD0.usda",
            "LOD1" : f"{asset_name}/LODs/{asset_name}_LOD1.usda",
            "LOD2" : f"{asset_name}/LODs/{asset_name}_LOD2.usda",
        }
        
        for version, key in versions:
            asset_version = Sublayer(
                id = uuid.uuid4(), 
                sublayerName = version, 
                filepath = key, 
                asset = asset)
            asset_version.save()

        return Response({'message': 'Successfully created metadata'}, status=200)

    except Exception as e:
        return Response({'error' : str(e)}, status=500)

# Query:
#   asset_name - A string as the name of the asset
#   new_version - A string as the new version as per our 7000 standards
#   metadata - a JSON containing below
#   - keywords (list of keyword strings)
#   - commit (Object contianing below)
#     - author
#     - timestamp
#     - version
#     - note
#   version_map - JSON map, refer to put_asset
#   - [key, s3_id] : S3 key and S3 version ID for a file changed in S3
#       -> keys can be: {asset_name}/{asset_name}.fbx for example I think

@api_view(['PUT'])
def put_metadata(request, asset_name, new_version):
    try:
        db_asset = None
        try:
            db_asset = Asset.objects.get(assetName=asset_name)
        except Asset.DoesNotExist as e:
            return Response({'error': 'Asset not found'}, status=404)

        metadata = request.data
        version_map = metadata['version_map'] # I don't think this is right

        for key, s3_id in version_map:
            sublayerName = None

            if key[-4:] == ".usda":
                sublayerName = "Variant Set"
                tags = key[-9:-4]
                if tags in {"_LOD0", "_LOD1", "_LOD2"}:
                    sublayerName = tags[1:]

            version_update = Sublayer(
                id = uuid.uuid4(),
                filepath = key,
                s3id = s3_id,
                sublayerName = sublayerName,
                version = new_version,
                asset = db_asset
            )
            version_update.save()

        for keyword in metadata["keywords"]:
            keyword, created = Keyword.objects.get_or_create(keyword=keyword.lower())
            db_asset.keywordsList.add(keyword)

        # Add a new commit
        commit = metadata["commit"]
        author = Author.objects.filter(username=commit["author"]).first()

        if author is None:
            author = Author(username=commit["author"], firstName="", lastName="")
            # DEFAULT PASSWORD set as "password"
            author.set_password("password")
            author.save()
            print(f"Author {commit['author']} not found, created new author.")

        commit = Commit(
            author = author, 
            timestamp = datetime.fromisoformat(commit["timestamp"]), 
            version = commit["version"] , 
            note = commit["note"], 
            asset = db_asset)
        commit.save()

        return Response({'message': 'Successfully updated metadata'}, status=200)
    
    except Exception as e:
        return Response({'error' : str(e)}, status=500)

# TODO: This is a temporary endpoint for testing. Once we have a proper auth system, we should use that.
@api_view(['POST'])
def checkout_asset(request, asset_name):
    # --- performance profiling --------------------------------
    start_time = time.perf_counter()
    initial_query_count = len(connection.queries)
    # -----------------------------------------------------------

    try:
        print(f"Request data: {request.data}")
        print(f"Request headers: {request.headers}")

        with transaction.atomic():  # row‑level lock scope
            # Fetch & lock the asset (opt ① + ② already in place)
            try:
                asset = (Asset.objects
                               .select_related('checkedOutBy')
                               .select_for_update()
                               .get(assetName=asset_name))
            except Asset.DoesNotExist:
                return Response({'error': 'Asset not found'}, status=404)

            pennkey = request.data.get('pennkey')
            if not pennkey:
                return Response({'error': 'pennkey is required'}, status=400)

            # If already checked out → 400
            if asset.checkedOutBy:
                who = asset.checkedOutBy
                return Response(
                    {'error': f'Asset is already checked out by {who.firstName} {who.lastName}'},
                    status=400,
                )

            # Fetch the user
            try:
                user = Author.objects.get(username=pennkey)
            except Author.DoesNotExist:
                return Response({'error': 'User not found'}, status=404)

            # ---------- perform checkout ----------
            asset.checkedOutBy = user
            asset.save(update_fields=['checkedOutBy'])           # optimisation ③

            (Sublayer.objects
                     .filter(asset=asset, checkedOutBy__isnull=True)  # optimisation ④
                     .update(checkedOutBy=user))

        return Response({
            'message': 'Asset and sublayers checked out successfully',
            'asset': {
                'name': asset.assetName,
                'checkedOutBy': user.pennkey,
                'isCheckedOut': True,
            },
        })

    except Exception as e:
        print(f"Unexpected error in checkout_asset: {str(e)}")
        return Response({'error': str(e)}, status=500)

    finally:
        end_time = time.perf_counter()
        queries_used = len(connection.queries) - initial_query_count
        print(f"[PERF DEBUG] checkout_asset took {end_time - start_time:.4f}s and used {queries_used} queries.")

@api_view(['GET'])
def download_asset(request, asset_name):
    """
    Stream the most‑recent version of <asset_name> as <asset_name>.zip.

    S3 layout expected:
        {asset_name}/{version}/{asset_name}.zip      ← cached bundle
        {asset_name}/{version}/...                   ← individual files (if no zip yet)

    Version strings are compared numerically component‑wise, e.g.
        01.02.10 < 01.03.00 < 02.00.00
    """
    t0 = time.perf_counter()
    print(f"[DEBUG] download_asset('{asset_name}')")

    try:
        # ── 1. Early 404 if asset not in DB ─────────────────────────────────────
        if not Asset.objects.filter(assetName=asset_name).exists():
            print("[DEBUG] Asset not found in DB")
            return Response({'error': 'Asset not found'}, status=404)
        print("[DEBUG] Asset exists in DB")

        # ── 2. S3 setup ─────────────────────────────────────────────────────────
        s3      = S3Manager()
        prefix  = f"{asset_name}/"                     # root folder
        all_keys = s3.list_s3_files(prefix)

        if not all_keys:
            return Response({'error': 'No files found for this asset'}, status=404)

        # ── 3. Detect all zipped versions ───────────────────────────────────────
        zipped = []  # list of (version_tuple, s3_key)
        for key in all_keys:
            # expecting "{asset_name}/{ver}/{asset_name}.zip"
            parts = key.split('/')
            if len(parts) == 3 and parts[0] == asset_name and parts[2] == f"{asset_name}.zip":
                ver_str = parts[1]
                try:
                    ver_tuple = tuple(int(p) for p in ver_str.split('.'))
                except ValueError:
                    continue  # skip weird version names that aren’t numeric
                zipped.append((ver_tuple, key))

        # ── 4. Choose the highest version if any zip exists ─────────────────────
        if zipped:
            latest_zip_key = max(zipped, key=lambda t: t[0])[1]
            print(f"[DEBUG] Cache‑hit: streaming '{latest_zip_key}'")
            obj = s3.client.get_object(Bucket=s3.bucket, Key=latest_zip_key)

            resp = StreamingHttpResponse(
                streaming_content=obj['Body'],
                content_type='application/zip'
            )
            resp['Content-Disposition'] = f'attachment; filename="{asset_name}.zip"'

            print(f"[PERF] download_asset cache‑hit → {time.perf_counter()-t0:.3f}s")
            return resp

        # ── 5. No pre‑built zip → find latest **loose** version folder ──────────
        # footprints look like "{asset}/{ver}/something"
        loose_versions = set()
        for key in all_keys:
            parts = key.split('/')
            if len(parts) >= 2 and parts[0] == asset_name:
                ver_str = parts[1]
                try:
                    ver_tuple = tuple(int(p) for p in ver_str.split('.'))
                    loose_versions.add((ver_tuple, ver_str))
                except ValueError:
                    pass

        if not loose_versions:
            return Response({'error': 'Asset files do not follow version pattern'}, status=500)

        latest_ver_tuple, latest_ver_str = max(loose_versions, key=lambda t: t[0])
        latest_prefix = f"{asset_name}/{latest_ver_str}/"
        keys = [k for k in all_keys if k.startswith(latest_prefix)]

        print(f"[DEBUG] Cache‑miss: bundling {len(keys)} objects from version {latest_ver_str}")

        # ── 6. Build zip in memory ──────────────────────────────────────────────
        zip_buffer = io.BytesIO()
        with ZipFile(zip_buffer, 'w', ZIP_DEFLATED) as zf:
            for key in keys:
                arc_name   = os.path.relpath(key, latest_prefix)  # strip version folder
                file_bytes = s3.download_s3_file(key)
                zf.writestr(arc_name, file_bytes)
        zip_buffer.seek(0)
        print(f"[DEBUG] ZIP built ({zip_buffer.getbuffer().nbytes} bytes)")

        # ── 7. Upload the new zip (cache‑fill) ──────────────────────────────────
        zip_key = f"{asset_name}/{latest_ver_str}/{asset_name}.zip"
        try:
            s3.upload_fileobj(zip_buffer, zip_key)
            print(f"[DEBUG] Uploaded ZIP back to S3 as '{zip_key}'")
            zip_buffer.seek(0)  # rewind for response
        except Exception as e:
            print(f"[WARN] Could not upload ZIP cache: {e}")

        # ── 8. Stream response ──────────────────────────────────────────────────
        resp = StreamingHttpResponse(zip_buffer, content_type='application/zip')
        resp['Content-Disposition'] = f'attachment; filename="{asset_name}.zip"'

        print(f"[PERF] download_asset cache‑miss → {time.perf_counter()-t0:.3f}s")
        return resp

    except Exception as e:
        print(f"[FATAL] download_asset error: {e}")
        traceback.print_exc()
        return Response({'error': str(e)}, status=500)

@api_view(['GET'])
def get_commits(request):
    try:
        commits = Commit.objects.all().order_by('-timestamp')
        commits_list = []
        
        for commit in commits:
            commits_list.append({
                'commitId': str(commit.id),
                'pennKey': commit.author.pennkey if commit.author else None,
                'versionNum': commit.version,
                'notes': commit.note,
                'commitDate': commit.timestamp.isoformat(),
                'hasMaterials': commit.sublayers.exists(),
                'state': [],  # This matches the frontend interface but we don't have state in backend
                'assetName': commit.asset.assetName
            })

        return Response({'commits': commits_list})
    except Exception as e:
        return Response({'error': str(e)}, status=500)

@api_view(['GET'])
def get_commit(request, commit_id):
    try:
        commit = Commit.objects.get(id=commit_id)
        
        commit_data = {
            'commitId': str(commit.id),
            'pennKey': commit.author.pennkey if commit.author else None,
            'versionNum': commit.version,
            'notes': commit.note,
            'commitDate': commit.timestamp.isoformat(),
            'hasMaterials': commit.sublayers.exists(),
            'state': [],  # This matches the frontend interface but we don't have state in backend
            'assetName': commit.asset.assetName,
            # Additional details for single commit view
            'authorName': f"{commit.author.firstName} {commit.author.lastName}" if commit.author else None,
            'authorEmail': commit.author.email if commit.author else None,
            'assetId': str(commit.asset.id),
            'sublayers': [
                {
                    'id': str(layer.id),
                    'sublayerName': layer.sublayerName,
                    'filepath': str(layer.filepath)
                } for layer in commit.sublayers.all()
            ]
        }

        return Response({'commit': commit_data})
    except Commit.DoesNotExist:
        return Response({'error': 'Commit not found'}, status=404)
    except Exception as e:
        return Response({'error': str(e)}, status=500)

@api_view(['GET'])
def get_users(request):
    try:
        authors = Author.objects.all().order_by('firstName', 'lastName')
        users_list = []
        
        for author in authors:
            users_list.append({
                'pennId': author.pennkey,
                'fullName': f"{author.firstName} {author.lastName}".strip() or author.pennkey,
            })

        return Response({'users': users_list})
    except Exception as e:
        return Response({'error': str(e)}, status=500)

@api_view(['GET'])
def get_user(request, pennkey):
    # Start the timer and capture initial query count
    start_time = time.perf_counter()
    initial_query_count = len(connection.queries)

    try:
        # Get number of recent commits to return (default to 5)
        num_recent_commits = int(request.GET.get('recent_commits', 5))
        if num_recent_commits < 1:
            num_recent_commits = 5  # Ensure at least 1 commit is returned

        # Get the author with prefetched related data in one query
        author = (
            Author.objects
            .prefetch_related(
                Prefetch(
                    'commits',
                    queryset=Commit.objects
                        .select_related('asset')
                        .order_by('-timestamp')[:num_recent_commits],
                    to_attr='recent_commits'
                )
            )
            .get(username=pennkey)
        )

        # Get both created and checked out assets in a single query with annotations
        assets = (
            Asset.objects
            .filter(commits__author=author)
            .annotate(
                first_commit_date=Min('commits__timestamp'),
                last_commit_date=Max('commits__timestamp'),
                is_created_by_user=Case(
                    When(
                        commits__author=author,
                        commits__timestamp=F('first_commit_date'),
                        then=True
                    ),
                    default=False,
                    output_field=BooleanField()
                ),
                is_checked_out_by_user=Case(
                    When(
                        commits__author=author,
                        commits__timestamp=F('last_commit_date'),
                        then=True
                    ),
                    default=False,
                    output_field=BooleanField()
                )
            )
            .distinct()
        )

        # Separate assets into created and checked out
        created_assets = [asset for asset in assets if asset.is_created_by_user]
        checked_out_assets = [asset for asset in assets if asset.is_checked_out_by_user]

        # Format the response with all the required information
        user_data = {
            'pennKey': author.pennkey,
            'fullName': f"{author.firstName} {author.lastName}".strip() or author.pennkey,
            'assetsCreated': [
                {
                    'name': asset.assetName,
                    'createdAt': asset.first_commit_date.isoformat()
                }
                for asset in created_assets
            ],
            'checkedOutAssets': [
                {
                    'name': asset.assetName,
                    'checkedOutAt': asset.last_commit_date.isoformat() if asset.last_commit_date else None
                }
                for asset in checked_out_assets
            ],
            'recentCommits': [
                {
                    'assetName': commit.asset.assetName,
                    'version': commit.version,
                    'note': commit.note,
                    'timestamp': commit.timestamp.isoformat()
                }
                for commit in author.recent_commits
            ]
        }

        return Response({'user': user_data})

    except Author.DoesNotExist:
        return Response({'error': 'User not found'}, status=404)
    except ValueError:
        return Response({'error': 'recent_commits parameter must be a positive integer'}, status=400)
    except Exception as e:
        return Response({'error': str(e)}, status=500)
    finally:
        # Performance logging
        end_time = time.perf_counter()
        elapsed_seconds = end_time - start_time

        final_query_count = len(connection.queries)
        queries_used = final_query_count - initial_query_count

        print(
            f"[PERF DEBUG] get_user took {elapsed_seconds:.4f} seconds "
            f"and used {queries_used} DB queries."
        )
import os
from library.models import Asset, Sublayer, Commit, Keyword, Author
from datetime import datetime
import uuid
from pathlib import Path
import json
import subprocess
import re
import requests
from django.conf import settings

folder_path = Path("C:\\Users\\njbhv\\Downloads\\Week 10 Assets")
folder_path2 = Path("C:\\Users\\njbhv\\Downloads\\Final Assets v2\\Assets")

class Script:
    
    def runFileCrawler(self):
        #self.addAuthors()
        for assetFolder in folder_path.iterdir():
            with (assetFolder / "metadata.json").open('r') as f:
                print("Processing", assetFolder)
                metadata = json.load(f)
                
                id = uuid.uuid4()
                assetName = metadata["assetName"]
                if assetName[-4:] == ".fbx":
                    assetName = assetName[:-4]
                hasTexture = False
                if "hasTexture" in metadata:
                    hasTexture = metadata["hasTexture"]
                thumbnailKey = f"{assetName}/thumbnail.png"
                asset = Asset(id=id, assetName=assetName, hasTexture=hasTexture, thumbnailKey=thumbnailKey)
                asset.save()
                for keyword in metadata["keywords"]:
                    keyword, created = Keyword.objects.get_or_create(keyword=keyword.lower())
                    asset.keywordsList.add(keyword)

                historyStr = "commitHistory" if "commitHistory" in metadata else "historical"
                for commit in metadata[historyStr]:
                    author = Author.objects.filter(username=commit["author"]).first()
                    if author is None:
                        author, created = Author.objects.get_or_create(username=commit["author"], password="", firstName="", lastName="")
                        author.set_password("password")
                        author.save()
                        print(f"Author {commit['author']} not found, created new author.")
                    
                    ourCommitNames = ["version", "timestamp", "note"]
                    theirCommitNames = ["version", "date", "changes"]
                    commitNames = ourCommitNames if historyStr == "commitHistory" else theirCommitNames

                    version = commit[commitNames[0]] 
                    timestamp = datetime.fromisoformat(commit[commitNames[1]])
                    note = commit[commitNames[2]]
                    commit = Commit(author=author, version=version, timestamp=timestamp, note=note, asset=asset)
                    commit.save()
                
                newer_asset_folder = Path(folder_path2) / assetName
                if not newer_asset_folder.exists():
                    print(f"Missing Folder for {assetName}, skipping...")
                    continue

                queue = [newer_asset_folder]
                discovered = set()
                while queue:
                    currDir = queue.pop()
                    print(currDir)
                    for item in currDir.iterdir():
                        if item.is_dir() and item not in discovered:
                            queue.append(item)
                            discovered.add(item)
                        elif item.is_file() and (item.suffix in [".usda", ".usdc", ".usd", ".png"]):
                            sublayerName = currDir.parts[-1]
                            if sublayerName == assetName:
                                sublayerName = "Unified"
                            version = commit.version
                            filepath = currDir.parts[len(newer_asset_folder.parts):]
                            if str(filepath).endswith(".usda"):
                                filepath = str(filepath).replace("\\", "/")
                            sublayer = Sublayer(id=uuid.uuid4(), version=version, sublayerName=sublayerName, filepath=filepath, asset=asset)
                            sublayer.save()
                            for otherLayer in commit.sublayers.all():
                                if otherLayer.filepath in filepath:
                                    otherLayer.internalDependencies.add(sublayer)
                                    otherLayer.save()

                            commit.sublayers.add(sublayer)
                            commit.save()

    def addAuthors(self):
        #Author.objects.all().delete()
        
        author = Author(username="willcai", password="", firstName="Will", lastName="Cai")
        author.set_password("password")
        author.save()
        author = Author(username="eschou", password="", firstName="Elyssa", lastName="Chou")
        author.set_password("password")
        author.save()
        author = Author(username="fernc", password="", firstName="Caroline", lastName="Fernandes")
        author.set_password("password")
        author.save()
        author = Author(username="geant", password="", firstName="Anthony", lastName="Ge")
        author.set_password("password")
        author.save()
        author = Author(username="jyguan", password="", firstName="Jackie", lastName="Guan")
        author.set_password("password")
        author.save()
        author = Author(username="aajiang", password="", firstName="Aaron", lastName="Jiang")
        author.set_password("password")
        author.save()
        author = Author(username="raclin", password="", firstName="Rachel", lastName="Lin")
        author.set_password("password")
        author.save()
        author = Author(username="liuamy05", password="", firstName="Amy", lastName="Liu")
        author.set_password("password")
        author.save()
        author = Author(username="claran", password="", firstName="Clara", lastName="Nolan")
        author.set_password("password")
        author.save()
        author = Author(username="soominp", password="", firstName="Jacky", lastName="Park")
        author.set_password("password")
        author.save()
        author = Author(username="chuu", password="", firstName="Christina", lastName="Qiu")
        author.set_password("password")
        author.save()
        author = Author(username="czw", password="", firstName="Charles", lastName="Wang")
        author.set_password("password")
        author.save()
        author = Author(username="cxndy", password="", firstName="Cindy", lastName="Xu")
        author.set_password("password")
        author.save()


    def runAddAsset(self, assetName, hasTexture, thumbnailFilepath, keywords, rootFolder):
        id = uuid.uuid4()
        asset = Asset(id=id, assetName=assetName, hasTexture=hasTexture, thumbnailFilepath=thumbnailFilepath)
        asset.save()
        for keyword in keywords:
            keyword, created = Keyword.objects.get_or_create(keyword=keyword.lower())
            asset.keywordsList.add(keyword)

            variantSet = Sublayer(id=uuid.uuid4(), sublayerName="Variant Set", filepath=rootFolder + f"//{assetName}.usda", asset=asset)
            variantSet.save()
            lod0 = Sublayer(id=uuid.uuid4(), sublayerName="LOD0", filepath=rootFolder + "//LODs" + f"//{assetName}_LOD0.usda", asset=asset)
            lod0.save()
            lod1 = Sublayer(id=uuid.uuid4(), sublayerName="LOD1", filepath=rootFolder + "//LODs" + f"//{assetName}_LOD1.usda", asset=asset)
            lod1.save()
            lod2 = Sublayer(id=uuid.uuid4(), sublayerName="LOD2", filepath=rootFolder + "//LODs" + f"//{assetName}_LOD2.usda", asset=asset)
            lod2.save()
    
    def runPrintAsset(self, assetName):
        asset = Asset.objects.filter(assetName=assetName)[0]
        print("Name: " + asset.assetName)
        print("Has Texture: " + str(asset.hasTexture))
        print("Keywords: " + str(asset.keywordsList.all()))
        print("Thumbnail Filepath: " + str(asset.thumbnailFilepath))

    def runGetAsset(self, assetName):
        return Sublayer.objects.filter(asset__assetName=assetName).filter(sublayerName="Variant Set")[0].filepath
    
    def runGetAssetInBlender(self, assetName):
        filepath = self.runGetAsset(assetName)
        filepath = "/".join(filepath.split("\\"))
        subprocess.run(["C:\\Program Files\\Blender Foundation\\Blender 4.3\\blender.exe",
                        "--python-expr",
                        f"import bpy\nbpy.ops.wm.usd_import(filepath='{filepath}')"])
    

    _VERSION_RE = re.compile(r'^\d+(?:\.\d+)*$')

    def parse_latest_version(version_list):
        """Return the numerically highest version string."""
        def to_tuple(v):
            return tuple(int(x) for x in v.split('.'))
        valid = [v for v in version_list if _VERSION_RE.match(v)]
        if not valid:
            return None
        return max(valid, key=to_tuple)
    
    def reorganize_s3_structure(self, asset_name: str,
                                    api_base_url: str = "http://localhost:8000"):
            """
            Ensure all S3 keys for <asset_name> follow <asset>/<version>/… .
            • Already‑organised assets are skipped.
            • Otherwise we query the commit API to discover the latest version,
            move stray files under that folder, and:
                – duplicate any *.glb  to  <asset>/<asset>.glb
                – duplicate the thumbnail image (first file ending with a
                known image extension) to  <asset>/<original_file_name>
            """
            s3 = S3Manager()
            prefix = f"{asset_name}/"
            keys   = s3.list_s3_files(prefix)

            if not keys:
                print(f"[WARN] No keys found for {asset_name}")
                return

            ok_pattern = re.compile(rf"^{re.escape(asset_name)}/\d+(?:\.\d+)+/")

            if all(ok_pattern.match(k) for k in keys):
                print(f"[INFO] {asset_name} already organised — skipping")
                return

            # ── Ask backend for latest version ────────────────────────────────────
            try:
                url = f"{api_base_url}/api/asset/{asset_name}/commits/"
                resp = requests.get(url, timeout=5)
                resp.raise_for_status()
                versions = {c["versionNum"] for c in resp.json().get("commits", [])}
                latest_version = self.parse_latest_version(versions)
            except Exception as e:
                print(f"[ERROR] Could not fetch commits for {asset_name}: {e}")
                return

            if latest_version is None:
                print(f"[ERROR] No valid versions found for {asset_name}")
                return

            print(f"[INFO] Using latest version {latest_version} for re‑org")

            # ── Find first thumbnail (image file) among stray keys ────────────────
            thumbnail_src_key = None
            for k in keys:
                if ok_pattern.match(k):
                    continue
                ext = PurePosixPath(k).suffix.lower()
                if ext in THUMB_EXTS:
                    thumbnail_src_key = k
                    break   # first match wins

            # ── Move / copy every stray key ───────────────────────────────────────
            for key in keys:
                if ok_pattern.match(key):
                    continue   # already organised

                rest    = key[len(prefix):]  # part after "<asset>/"
                new_key = f"{asset_name}/{latest_version}/{rest}"

                print(f"  • moving {key}  →  {new_key}")
                s3.copy_file(key, new_key)
                s3.delete_file(key)

                # duplicate .glb at root
                if key.lower().endswith(".glb"):
                    root_glb = f"{asset_name}/{asset_name}.glb"
                    print(f"    ↳ duplicating to {root_glb}")
                    s3.copy_file(new_key, root_glb)

            # ── Duplicate thumbnail after moves so we copy from its new location ──
            if thumbnail_src_key:
                thumb_name = PurePosixPath(thumbnail_src_key).name
                root_thumb = f"{asset_name}/{thumb_name}"
                organised_thumb_key = f"{asset_name}/{latest_version}/{thumb_name}"
                print(f"  • duplicating thumbnail to {root_thumb}")
                s3.copy_file(organised_thumb_key, root_thumb)

            print(f"[DONE] Re‑organisation complete for {asset_name}")

    def reorganize_all_assets(self, api_base_url: str = "http://localhost:8000"):
            """
            Scan the S3 bucket for every top‑level prefix and invoke
            reorganize_s3_structure() on each asset folder.
            """
            s3 = S3Manager()

            # Fast way to list *only* first‑level prefixes:
            #   GET ?list-type=2&delimiter=/
            paginator = s3.client.get_paginator('list_objects_v2')
            prefixes  = set()

            for page in paginator.paginate(Bucket=s3.bucket, Delimiter='/'):
                # CommonPrefixes will look like  {'Prefix': 'BookStack/'} …
                for cp in page.get('CommonPrefixes', []):
                    name = cp['Prefix'].rstrip('/')          # 'BookStack'
                    prefixes.add(name)

            if not prefixes:
                print("[WARN] No asset prefixes found in bucket!")
                return

            print(f"[INFO] Found {len(prefixes)} asset folders to check")

            for asset_name in sorted(prefixes):
                try:
                    print(f"\n==== {asset_name} ====")
                    self.reorganize_s3_structure(asset_name, api_base_url=api_base_url)
                except Exception as e:
                    print(f"[ERROR] Failed on {asset_name}: {e}")

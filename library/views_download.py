from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi

from library.models import Asset, Commit, Sublayer, StatusTag
from library.utils.s3_utils import S3Manager
from library.utils.zipper import zip_files_from_memory

from django.http import StreamingHttpResponse

import os

@swagger_auto_schema(
    method='get',
    responses={200: openapi.Response(description="Zip file", content_type="application/zip")})
@api_view(['GET'])
def download_asset_by_commit(request, asset_name, commit): # `commit`` is version number of commit
    s3 = S3Manager()

    asset = get_object_or_404(Asset, assetName=asset_name)
    commit = get_object_or_404(Commit, asset=asset, version=commit)

    ZIP_PREFIX=f"{asset_name}_{commit}"

    zip_data = {}
    for sublayer in commit.sublayers.all():
        sublayer: Sublayer
        
        # continue with new found sublayer of desired tag
        truncated_key, file_bytes = _get_bytes_for_sublayer(s3, sublayer)

        path_in_zip = os.path.join(ZIP_PREFIX, truncated_key)
        
        zip_data[path_in_zip] = file_bytes

    zip_buffer = zip_files_from_memory(zip_data)

    response = StreamingHttpResponse(zip_buffer, content_type='application/zip')
    response['Content-Disposition'] = f'attachment; filename=f"{ZIP_PREFIX}.zip"'
    return response

@swagger_auto_schema(
    method='get', 
    manual_parameters=[
        openapi.Parameter(
            'tag',
            openapi.IN_PATH,
            description='Options: "latest", "approved"',
            type=openapi.TYPE_STRING,
        ),
    ], responses={200: openapi.Response(description="Binary file stream", content_type="application/zip")})

@api_view(['GET'])
def download_asset_by_tag(request, asset_name, tag: str):
    s3 = S3Manager()

    asset = get_object_or_404(Asset, assetName=asset_name)
    tagObj = get_object_or_404(StatusTag, statusTag=tag)
    commit = Commit.objects.filter(asset=asset).order_by('-version')[0] # latest commit

    ZIP_PREFIX=f"{asset_name}_{tag}"

    zip_data = {}
    for sl in commit.sublayers.all():
        sublayer: Sublayer = sl
        while True:
            if sublayer.status == tagObj:
                break
            elif sublayer.prevVersion:
                sublayer = sublayer.prevVersion
            else: # did not find a sublayer with the desired tag
                sublayer = sl # set to original sublayer in case our desired tag is "latest"
                break

        if sublayer == sl and tagObj.statusTag != "latest": 
            continue # this sublayer does not have the desired tag in its history. don't include in zip

        # continue with new found sublayer of desired tag
        truncated_key, file_bytes = _get_bytes_for_sublayer(s3, sublayer)

        path_in_zip = os.path.join(ZIP_PREFIX, truncated_key)
        
        zip_data[path_in_zip] = file_bytes

    zip_buffer = zip_files_from_memory(zip_data)

    response = StreamingHttpResponse(zip_buffer, content_type='application/zip')
    response['Content-Disposition'] = f'attachment; filename=f"{ZIP_PREFIX}.zip"'
    return response

def _get_bytes_for_sublayer(s3: S3Manager, sublayer: Sublayer) -> tuple[str, bytes]: # returns: truncated s3 key, bytes of file
    _sublayer_filepath = sublayer.filepath.split("/", maxsplit=1)
        
    s3_bucket = _sublayer_filepath[0]
    s3_key = _sublayer_filepath[1]

    try:
        file_bytes = s3.download_s3_file(key=s3_key, bucket=s3_bucket)
    except Exception as e:
        raise SystemError(f"Error occured in downloading the file from S3: {e}")
    
    print(f"[DEBUG] Downloaded '{s3_key}' ({len(file_bytes)} bytes)")

    truncated_key = s3_key[s3_key.find(sublayer.asset.assetName):] # truncates key to beginning of first occurence of asset_name

    return truncated_key, file_bytes
from datetime import datetime
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .utils.s3_utils import S3Manager
import zipfile
import os
import tempfile

from library.models import Asset, Keyword, Author, Commit, Sublayer

@api_view(['POST'])
def post_asset(request, asset_name, version):
    try:
        # On the frontend, we should first check if metadata exists
        # Metadata upload is a separate POST

        if Asset.objects.get(assetName=asset_name):
            return Response({'error': 'Asset already exists'}, status=400)

        zip = request.FILES.getlist('file')
        if not zip or not zip.name.endswith('.zip'):
            return Response({'error': 'Request missing files'}, status=404)
        
        s3 = S3Manager()

        with zipfile.ZipFile(zip) as zip_ref:
            for file_info in zip_ref.infolist():
                if file_info.is_dir():
                    continue

                with zip_ref.open(file_info.filename) as extracted_file:
                    s3.upload_fileobj(
                        extracted_file, 
                        f"{asset_name}/{version}/{file_info.filename}"
                    )

        return Response({'message': 'Successfully uploaded'}, status=200)
    
    except Exception as e:
        return Response({'error': str(e)}, status=500)
    

@api_view(['PUT'])
def put_asset(request, asset_name):
    try:
        try:
            Asset.objects.get(assetName=asset_name)
        except Asset.DoesNotExist as e:
            return Response({'error': 'Asset not found'}, status=404)
            
        files = request.FILES.getlist('files')
        if not files:
            return Response({'error': 'Request missing files'}, status=404)

        s3 = S3Manager()
        version_map = {}
        for file in files:
            key = f"{asset_name}/{file.name}"
            response = s3.update_file(file, key)

            # insert key to map, return this for our metadata
            version_map.update({key, response["VersionId"]})

        return Response({'message': 'Successfully updated', 'version_map': version_map}, status=200)

    except Exception as e:
        return Response({'error' : str(e)}, status=500)
from datetime import datetime
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .utils.s3_utils import S3Manager
from pxr import Usd
import zipfile
import io
import tempfile

from library.models import Asset, Keyword, Author, Commit, Sublayer

from library.tests.test_post_asset import (
    check_usd_properties
)

def verify_asset(extracted_file, file_name):
    try:
        # Write the in-memory file to a temporary file
        with tempfile.NamedTemporaryFile(suffix=".usd", delete=False) as tmp:
            data = extracted_file.read()
            tmp.write(data)
            tmp.flush()
            tmp_filename = tmp.name

        stage = Usd.Stage.Open(tmp_filename)
        check_usd_properties(stage, file_name)
        return (False, "No error")
    except AssertionError as ae:
        print(str(ae))
        return (False, str(ae))
    except Exception as e:
        print(f"General Exception: {e}")
        return (False, f"Unexpected error: {e}")

def extract_zip(request, asset_name, is_upload):
    # TO DO: Find a way to cache this result so upload will grab results from verify
    zip = request.FILES.get('file')
    version = request.POST.get('version')

    if not zip or not zip.name.endswith('zip'):
        return Response({'error' : 'Not a zip, or missing files'}, status=404)
    
    s3 = S3Manager() if is_upload else None

    with zipfile.ZipFile(zip) as zip_ref:
        for file_info in zip_ref.infolist():
            
            if file_info.is_dir() or not file_info.filename.endswith('.usd'):
                continue
            
            with zip_ref.open(file_info.filename) as extracted_file:
                result = verify_asset(extracted_file, file_info.filename)

                if not result[0]:
                    print("you failed")
                    return (False, result[1])
                
                if is_upload:
                    s3.upload_fileobj(
                        extracted_file, 
                        f"{asset_name}/{version}/{file_info.filename}"
                    )
    
    return (True, "good job")

@api_view(['POST'])
def get_verify(request, asset_name):
    try:
        print("you hit it")
        result, error_msg = extract_zip(request, asset_name, is_upload=False)
        return Response(data={
            'result' : result,
            'error_msg' : error_msg
            }, status=200) 
    except Exception as e:
        return Response({'error': str(e)}, status=500)

@api_view(['POST'])
def post_asset(request, asset_name):
    try:
        # On the frontend, we should first check if metadata exists
        # Metadata upload is a separate POST

        if extract_zip(request, asset_name, is_upload=True):
            return Response({'message': 'Successfully uploaded'}, status=200)
    
    except Exception as e:
        return Response({'error': str(e)}, status=500)
    

@api_view(['PUT'])
def put_asset(request, asset_name, new_version):
    try:
        if not Asset.objects.get(assetName=asset_name):
            return Response({'error': 'Asset does not exist'}, status=400)
            
        files = request.FILES.getlist('files')
        if not files:
            return Response({'error': 'Request missing files'}, status=404)

        s3 = S3Manager()
        version_map = {}

        with zipfile.ZipFile(zip) as zip_ref:
            for file_info in zip_ref.infolist():
                if file_info.is_dir():
                    continue

                with zip_ref.open(file_info.filename) as extracted_file:
                    key = f"{asset_name}/{new_version}/{file_info.filename}"
                    response = s3.update_file(
                        extracted_file, 
                        key
                    )

                    version_map.update({key, response["VersionId"]})

        return Response({'message': 'Successfully updated', 'version_map': version_map}, status=200)

    except Exception as e:
        return Response({'error' : str(e)}, status=500)
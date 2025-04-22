from datetime import datetime
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .utils.s3_utils import S3Manager
from pxr import Usd
import zipfile
import tempfile
from pathlib import Path

from library.models import Asset

from library.usd_validation import (
    core, geometry, materials, references, structure
)

def verify_asset(extracted_file, file_name, tmp_dir):
    try:
        # Write the in-memory file to a temporary file
        with tempfile.NamedTemporaryFile(suffix=".usd", delete=False) as tmp:
            data = extracted_file.read()
            tmp.write(data)
            tmp.flush()
            tmp_filename = tmp.name

        stage = Usd.Stage.Open(tmp_filename)
        core.check_usd_properties(stage, file_name)
        geometry.check_usd_geometry(stage, file_name)
        materials.check_usd_materials(stage, file_name)
        references.check_usd_references(stage, Path(file_name), tmp_dir)
        if Path(file_name).stem == Path(file_name).parents[0].name:
            structure.check_usd_structure(stage, file_name, tmp_dir)
        return (True, "No error")
    except AssertionError as ae:
        print(f"Assertion error: {str(ae)}")
        return (False, f"Assertion error: {str(ae)}")
    except Exception as e:
        print(f"General Exception: {e}")
        return (False, f"Unexpected error: {e}")

def extract_zip(request, asset_name, is_upload):
    # TO DO: Find a way to cache this result so upload will grab results from verify
    zip = request.FILES.get('file')
    version = request.POST.get('version')

    if not zip or not zip.name.endswith('zip'):
        return Response({'error': 'Not a zip, or missing files'}, status=404)
    
    s3 = S3Manager() if is_upload else None

    # Extract to a temporary directory
    with zipfile.ZipFile(zip) as zip_ref:
        temp_dir = Path(tempfile.mkdtemp())

        # Extract all files to temp_dir while preserving folder structure
        for file_info in zip_ref.infolist():
            # Create the full path for the file
            extracted_file_path = temp_dir / file_info.filename
            
            # If the file is a directory, just make sure it exists
            if file_info.is_dir():
                extracted_file_path.mkdir(parents=True, exist_ok=True)
                continue
            
            # Make sure the directory structure exists for the file
            extracted_file_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Extract the file
            with zip_ref.open(file_info) as extracted_file:
                with open(extracted_file_path, 'wb') as out_file:
                    out_file.write(extracted_file.read())

        # Run USD verification on extracted files
        for file_info in zip_ref.infolist():
            if file_info.is_dir() or not (file_info.filename.endswith('.usd') or file_info.filename.endswith('.usda')):
                continue
            
            # Only process USD files
            with open(temp_dir / file_info.filename, 'rb') as extracted_file:
                result = verify_asset(extracted_file, file_info.filename, temp_dir)

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
                    
        s3.upload_fileobj(zip, f"{asset_name}/{version}/{asset_name}.zip")


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
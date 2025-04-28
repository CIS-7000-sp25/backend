from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.db import transaction
from drf_yasg.utils import swagger_auto_schema

from pxr import Usd
import zipfile
import tempfile
from pathlib import Path
import os

from library.models import Asset, Author
from library.serializers import (
    CommitSerializer, AssetSerializer, UploadSerializer, VerifySerializer, SuccessResponseSerializer, ErrorResponseSerializer
)

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

def validate_zip(request, asset_name):
    # TO DO: Find a way to cache this result so upload will grab results from verify
    zip = request.FILES.get('file')

    if not zip or not zip.name.endswith('zip'):
        return (False, "Not a zip, or missing files")

    # Extract to a temporary directory
    with zipfile.ZipFile(zip) as zip_ref:
        temp_dir = Path(tempfile.mkdtemp())

        if not os.path.isfile(os.path.join(temp_dir, f"{asset_name}/contrib/.thumbs/thumbnail.png")):
            return (False, "Error: No `thumbnail.png` file exists at `<ASSET_NAME>/contrib/.thumbs/thumbnail.png`")

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

        result = (True, "") # S3 + MySQL changes need to be either or. Can't partially upload some files then fail
        # Run USD verification on extracted files
        for file_info in zip_ref.infolist():
            if file_info.is_dir():
                continue

            if file_info.filename.endswith('.usd') or file_info.filename.endswith('.usda'):
                with open(temp_dir / file_info.filename, 'rb') as extracted_file:
                    fileResult = verify_asset(extracted_file, file_info.filename, temp_dir)

                    newStatus: bool = result[0] and fileResult[0]
                    newMessage: str = result[1]
                    if not fileResult[0]:
                        newMessage: str = f"{newMessage}" + f"\n{fileResult[1]}\n"

                    result = (newStatus, newMessage)

        if not result[0]:
            print("Upload failed")

        print(result[1])
        
        return result

@swagger_auto_schema(method='post', request_body=VerifySerializer, consumes=["multipart/form-data"], responses={200: SuccessResponseSerializer, 400: ErrorResponseSerializer, 404: ErrorResponseSerializer, 500: ErrorResponseSerializer})
@api_view(['POST'])
def get_verify(request, asset_name):
    try:
        print("you hit it")
        result, error_msg = validate_zip(request, asset_name)
        if result:
            return Response({'success': True, 'message': "Passed validation!"}, status=200) 
        else:
            return Response({'success': False, 'message': error_msg}, status=200) 
    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)

@swagger_auto_schema(method='post', request_body=UploadSerializer, consumes=["multipart/form-data"], responses={200: SuccessResponseSerializer, 400: ErrorResponseSerializer, 500: ErrorResponseSerializer})
@api_view(['POST'])
def post_asset(request, asset_name):
    try:
        with transaction.atomic():  # whole asset + commit flow in one transaction
            asset_serializer = AssetSerializer(data=request.data, context={"assetName": asset_name})
            if not asset_serializer.is_valid():
                return Response({'success': False, 'message': "Input data invalid: " + asset_serializer.errors}, status=400)

            asset = asset_serializer.save()

            author = get_object_or_404(Author, username=request.data.get("pennkey"))
            commit_serializer = CommitSerializer(data=request.data, context={"asset": asset, "author": author})
            if not commit_serializer.is_valid():
                return Response({'success': False, 'message': "Input data invalid: " + commit_serializer.errors}, status=400)

            commit = commit_serializer.save()
            return Response({'success': True, 'message': "Successfully uploaded.", 'id': commit.id}, status=200)

    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)
    
@swagger_auto_schema(method='put', request_body=UploadSerializer, consumes=["multipart/form-data"], responses={200: SuccessResponseSerializer, 400: ErrorResponseSerializer, 404: ErrorResponseSerializer, 500: ErrorResponseSerializer})
@api_view(['PUT'])
def put_asset(request, asset_name):
    try:
        with transaction.atomic():  # whole asset + commit flow in one transaction
            asset = get_object_or_404(Asset, assetName=asset_name) # automatically return a 404 Response if the asset is missing.
            author = get_object_or_404(Author, username=request.data.get("pennkey"))

            serializer = CommitSerializer(data=request.data, context={"asset": asset, "author": author})

            if serializer.is_valid():
                    commit = serializer.save()

                    return Response({'success': True, 'message': f"Successfully uploaded. Commit created: {commit}"}, status=200)
            else:
                return Response({'success': False, 'message': "Input data invalid: " + serializer.errors}, status=400)
    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)
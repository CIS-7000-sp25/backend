from rest_framework.decorators import api_view, parser_classes, permission_classes
from rest_framework.parsers import MultiPartParser
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from django.db import transaction
from drf_yasg.utils import swagger_auto_schema

from pxr import Usd
import zipfile
import tempfile
from pathlib import Path
import os
import json

from library.models import Asset, Author, Keyword
from library.serializers import (
    CommitSerializer, AssetSerializer, UploadSerializer, CheckinSerializer, VerifySerializer, SuccessResponseSerializer, ErrorResponseSerializer
)

from library.usd_validation import (
    core, geometry, materials, references, structure
)

def verify_asset(extracted_file, file_name, tmp_dir, asset_name, isStrict):
    try:
        # Write the in-memory file to a temporary file
        with tempfile.NamedTemporaryFile(suffix=".usd", delete=False) as tmp:
            data = extracted_file.read()
            tmp.write(data)
            tmp.flush()
            tmp_filename = tmp.name

        stage = Usd.Stage.Open(tmp_filename)

        if (isStrict):
            core.check_usd_properties(stage, file_name)
            geometry.check_usd_geometry(stage, file_name)
            materials.check_usd_materials(stage, file_name)
            references.check_usd_references(stage, Path(file_name), tmp_dir)
            if Path(file_name).stem == Path(file_name).parents[0].name:
                structure.check_usd_structure(file_name, tmp_dir, asset_name)
        else:
            structure.check_basic_structure(file_name, tmp_dir, asset_name)

        return (True, "No error")
    except AssertionError as ae:
        print(f"Assertion error: {str(ae)}")
        return (False, f"Assertion error: {str(ae)}")
    except Exception as e:
        print(f"General Exception: {e}")
        return (False, f"Unexpected error: {e}")

def validate_zip(request, asset_name, isStrict):
    # TO DO: Find a way to cache this result so upload will grab results from verify
    zip = request.FILES.get('file')

    if not zip or not zip.name.endswith('zip'):
        return (False, "Not a zip, or missing files")
    
    zip_stem = Path(zip.name).stem
    if zip_stem != asset_name:
        return (False, f"Error: Zip file name '{zip_stem}' does not match expected asset name '{asset_name}'")

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

        result = (True, "") # S3 + MySQL changes need to be either or. Can't partially upload some files then fail
        # Run USD verification on extracted files
        for file_info in zip_ref.infolist():
            if file_info.is_dir():
                continue

            if file_info.filename.endswith('.usd') or file_info.filename.endswith('.usda'):
                with open(temp_dir / file_info.filename, 'rb') as extracted_file:
                    fileResult = verify_asset(extracted_file, file_info.filename, temp_dir, asset_name, isStrict)

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
@parser_classes([MultiPartParser])
def get_verify(request, asset_name):
    try:
        serializer = VerifySerializer(data=request.data)
        if not serializer.is_valid():
            return Response({'success': False, 'message': "Input data invalid: " + json.dumps(serializer.errors)}, status=400)

        isStrict = serializer.validated_data.get("isStrict")
        print(f"QC isStrict = {isStrict}")

        result, error_msg = validate_zip(request, asset_name, isStrict)
        if result:
            return Response({'success': True, 'message': "Passed validation!"}, status=200) 
        else:
            return Response({'success': False, 'message': error_msg}, status=200) 
    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)

@swagger_auto_schema(method='post', request_body=UploadSerializer, consumes=["multipart/form-data"], responses={200: SuccessResponseSerializer, 400: ErrorResponseSerializer, 500: ErrorResponseSerializer})
@api_view(['POST'])
@parser_classes([MultiPartParser])
@permission_classes([IsAuthenticated])
def post_asset(request, asset_name):
    try:
        with transaction.atomic():  # whole asset + commit flow in one transaction
            newData = request.data
            newData["version"] = "01.00.00" # version is always hardcoded to "01.00.00"

            asset_serializer = AssetSerializer(data=newData, context={"assetName": asset_name, "isUpload": True})
            if not asset_serializer.is_valid():
                return Response({'success': False, 'message': "Input data invalid: " + json.dumps(asset_serializer.errors)}, status=400)

            asset = asset_serializer.save()

            author = get_object_or_404(Author, username=(request.user.username if request.user else request.data.get("pennkey")))

            commit_serializer = CommitSerializer(data=newData, context={"asset": asset, "author": author})

            if not commit_serializer.is_valid():
                return Response({'success': False, 'message': "Input data invalid: " + json.dumps(commit_serializer.errors)}, status=400)

            commit = commit_serializer.save()
            return Response({'success': True, 'message': "Successfully uploaded.", 'id': commit.id}, status=200)

    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)
    
@swagger_auto_schema(method='put', request_body=CheckinSerializer, consumes=["multipart/form-data"], responses={200: SuccessResponseSerializer, 400: ErrorResponseSerializer, 404: ErrorResponseSerializer, 500: ErrorResponseSerializer})
@api_view(['PUT'])
@parser_classes([MultiPartParser])
@permission_classes([IsAuthenticated])
def put_asset(request, asset_name):
    try:
        with transaction.atomic():  # whole asset + commit flow in one transaction
            asset = get_object_or_404(Asset, assetName=asset_name) # automatically return a 404 Response if the asset is missing.
            
            asset_serializer = AssetSerializer(asset, data=request.data, partial=True, context={"assetName": asset.assetName})
            if asset_serializer.is_valid():
                asset_serializer.save()
            else:
                return Response({
                    'success': False,
                    'message': "Input data invalid: " + json.dumps(asset_serializer.errors)
                }, status=400)
            
            author = get_object_or_404(Author, username=(request.user.username if request.user else request.data.get("pennkey")))

            commitSerializer = CommitSerializer(data=request.data, context={"asset": asset, "author": author, "isUpload": False})
            
            if commitSerializer.is_valid():
                commit = commitSerializer.save()

                return Response({'success': True, 'message': f"Successfully uploaded. Commit created: {commit}"}, status=200)
            else:
                return Response({'success': False, 'message': "Input data invalid: " + json.dumps(commitSerializer.errors)}, status=400)
    except Exception as e:
        return Response({'success': False, 'message': "Error occurred on the backend server: " + str(e)}, status=500)
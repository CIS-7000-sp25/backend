from rest_framework.decorators import api_view
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi

@swagger_auto_schema(
    method='get',
    responses={200: openapi.Response(description="Binary file stream", content_type="application/zip")})
@api_view(['GET'])
def download_asset_by_version(request, assetName):
    pass

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
def download_asset_by_tag(request, assetName, tag: str):
    pass
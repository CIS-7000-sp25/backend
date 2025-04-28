from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from drf_yasg.utils import swagger_auto_schema
from rest_framework.response import Response

from library.models import Asset, Commit, Sublayer, StatusTag

from library.serializers import CommitDictSerializer

@swagger_auto_schema(
    method='get',
    responses={200: CommitDictSerializer(many=True)})
@api_view(['GET'])
def get_asset_commits(request, asset_name):
    asset = get_object_or_404(Asset, assetName=asset_name)
    all_commits = Commit.objects.filter(asset=asset).order_by('-version')

    commit_list = []
    for commit in all_commits:
        commit_list.append(commit.to_dict())

    return Response(commit_list, status=200)

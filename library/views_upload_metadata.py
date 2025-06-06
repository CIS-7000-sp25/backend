from datetime import datetime
import uuid
from rest_framework.decorators import api_view
from rest_framework.response import Response

from library.models import Asset, Keyword, Author, Commit, Sublayer
from .utils.s3_utils import S3Manager
from pxr import Usd
import zipfile
import json

@api_view(['POST']) # DEPRECATED
def post_asset_metadata(request, asset_name):
    try:
        # On the frontend, we should first check if metadata exists
        # Metadata upload is a separate POST
        
        if Asset.objects.filter(assetName=asset_name).exists(): 
            return Response({'error' : 'Asset already exists'}, status=400)

        metadata = request.data

        asset = Asset(
            id = uuid.uuid4(),
            assetName = asset_name,
            hasTexture = metadata["hasTexture"],
            thumbnailKey = f"{asset_name}/thumbnail.png"
        )
        asset.save()

        for keyword in metadata["keywords"]:
            keyword, created = Keyword.objects.get_or_create(keyword=keyword.lower())
            asset.keywordsList.add(keyword)

        commit_json = metadata["commit"]
        author = Author.objects.filter(username=commit_json["author"]).first()

        if author is None:
            author = Author(username=commit_json["author"], firstName="", lastName="")
            # DEFAULT PASSWORD set as "password"
            author.set_password("password")
            author.save()
            print(f"Author {commit_json['author']} not found, created new author.")

        commit = Commit(
            author = author, 
            timestamp = datetime.fromisoformat(commit_json["timestamp"]), 
            version = commit_json["version"] , 
            note = commit_json["note"], 
            asset = asset)
        commit.save()

        sublayers = {
            "Variant Set" : f"{asset_name}/{asset_name}.usda",
            "LOD0" : f"{asset_name}/LODs/{asset_name}_LOD0.usda",
            "LOD1" : f"{asset_name}/LODs/{asset_name}_LOD1.usda",
            "LOD2" : f"{asset_name}/LODs/{asset_name}_LOD2.usda",
        }

        print("good job")
        
        for sublayer, path in sublayers.items():
            sublayer_obj = Sublayer(
                id = uuid.uuid4(), 
                sublayerName = sublayer, 
                filepath = path,
                asset = asset)
            sublayer_obj.save()

        print("goodeststst job")

        return Response({'message': 'Successfully created metadata'}, status=200)

    except Exception as e:
        print('bad, error: ', str(e))
        return Response({'error': str(e)}, status=500)
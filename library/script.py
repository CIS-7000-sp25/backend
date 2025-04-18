import os
from library.models import Asset, Sublayer, Commit, Keyword, Author
from datetime import datetime
import uuid
from pathlib import Path
import json
import subprocess
from django.conf import settings

folder_path = Path("C:\\Users\\njbhv\\Downloads\\Week 4 Assets")
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
from django.db.models import Prefetch, OuterRef
from django.core.management.base import BaseCommand
from library.models import Asset, Sublayer, Commit, Keyword
from library.utils.s3_utils import S3Manager
from datetime import datetime
import os
import ast
import uuid

"""
python manage.py refactor sublayer --destructive
python manage.py refactor commit --destructive
"""

class Command(BaseCommand):
    help = """Easily refactor database. Usage: 'python manage.py refactor {sublayer, commit}"""

    def add_arguments(self, parser):
        parser.add_argument('method', 
                            type=str, 
                            choices=['sublayer', 
                                     'commit']
                                     )
        parser.add_argument('--destructive', 
                            action='store_true',
                            help='When used with the `sublayer` method, will modify all Sublayer.version values to the newest commit version of that asset.' \
                            'When used with the `commit` method, it will create a new commit of each asset',
                                     )

    def handle(self, *args, **options):
        print(options)
        match options['method']:
            case "sublayer":
                self.refactorSublayer(options['destructive'])
            case "commit":
                self.refactorCommit(options['destructive'])

    def refactorCommit(self, destructive:bool=False):
        if destructive:
            for asset in Asset.objects.all():
                if asset.assetName in ["we", "rrrrr", "ww"]:
                    print("Deleting...", asset.assetName)
                    asset.delete()
                elif len(Commit.objects.filter(asset=asset)) != 0:
                    first_author = Commit.objects.filter(asset=asset).order_by('timestamp')[0].author
                    latestCommit = Commit.objects.filter(asset=asset).order_by('-timestamp')[0]
                    newVersionInt = (int(latestCommit.version[1]) + 1)

                    newCommit = Commit(author=first_author, version=f"0{newVersionInt}.00.00", timestamp=datetime.now().strftime('%Y-%m-%d 12:21:35+00:00'), note="Refactor to final project structure", asset=asset)
                    newCommit.save()
                    sublayers = Sublayer.objects.filter(asset=asset)
                    newCommit.sublayers.set(sublayers)
                    newCommit.save()
                    print(newCommit, newCommit.author, newCommit.timestamp)
                    print([sublayer for sublayer in newCommit.sublayers.all()])

                    newCommit.save()

        commits = Commit.objects.all()
        
        for commit in commits:
            vers = commit.version
            if len(vers) == 3:
                match vers:
                    case "1.0":
                        commit.version = "01.00.00"
                    case "1.1":
                        commit.version = "02.00.00"
                    case "1.2":
                        commit.version = "03.00.00"
                    case "1.3":
                        commit.version = "04.00.00"
                    case "1.4":
                        commit.version = "05.00.00"
            if len(vers) == 7:
                commit.version = f"0{commit.version}"

                print(commit.version)
                commit.save()

    def refactorSublayer(self, destructive: bool=False):
        s3 = S3Manager()
        sublayers = Sublayer.objects.all()

        for sl in sublayers:
            if destructive:
                print(sl.asset.assetName)
                latestCommit = Commit.objects.filter(asset=sl.asset).order_by('-timestamp')[0]
                sl.version = latestCommit.version
                sl.save()

            if "(" in sl.filepath:
                s3Key = "Assets"
                if sl.sublayerName == "Unified":
                    s3Key = os.path.join(s3Key, sl.asset.assetName, f"{sl.asset.assetName}.usd")
                else:
                    parsed = ast.literal_eval(sl.filepath)
                    s3Key = os.path.join(s3Key, sl.asset.assetName, *parsed)
                    lastPart = parsed[-1]

                    if lastPart == "texture":
                        s3Key += f"/{parsed[-2]}.png"
                    elif "LOD" in lastPart or lastPart == "bbox" or parsed[-2] == "material":
                        s3Key += f"/{parsed[-2]}_{lastPart}.usda"
                    else:
                        s3Key += f"/{lastPart}.usda"

                sl.filepath = s3Key
                sl.s3_versionID = s3.get_s3_versionID(s3Key)

                sl.save()

            print(sl, " | ", sl.version, " | ", sl.filepath, " | ", sl.s3_versionID)

    suppressed_base_arguments = ["--version", "--verbosity", "--settings", "--pythonpath", "--traceback", "--no-color", "--force-color", "--skip-checks"]



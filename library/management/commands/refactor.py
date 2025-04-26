from django.db.models import Prefetch, OuterRef
from django.core.management.base import BaseCommand
from library.models import Asset, Sublayer, Commit, Keyword
from library.utils.s3_utils import S3Manager
from datetime import datetime, MINYEAR, timezone, timedelta
import os
import ast
import re
import click

"""
python manage.py refactor sublayer --destructive
python manage.py refactor commit --destructive
"""

DT_FMT="%m-%d-%Y %H:%M:%S%:z"

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
        commits = Commit.objects.all()

        if click.confirm(f"Fixing timestamp-related commit history. Continue?"):
            for asset in Asset.objects.all():
                prevCommitTimestamp = datetime.min.replace(tzinfo=timezone.utc)
                for commit in Commit.objects.filter(asset=asset).order_by('version'):
                    currCommitTimestamp = commit.timestamp
                    if currCommitTimestamp < prevCommitTimestamp:
                        print(f"DETECTED: {asset.assetName} commit version {commit.version} timestamp is {currCommitTimestamp}, but a prior commit's timestamp is {prevCommitTimestamp}.")
                        if click.confirm(f"Fixing strange timestamps in {asset.assetName} commit history. Continue?"):
                            commit.timestamp = prevCommitTimestamp + timedelta(seconds=1)
                            commit.save()
                            print(f"New Current: {commit.timestamp}, Prev: {prevCommitTimestamp}")
                    prevCommitTimestamp = commit.timestamp
                click.echo(f"{asset.assetName} is clear!")
            
        
        if click.confirm('Refactoring 1.x commit versions to 0x.00.00 versions. Is this necessary?'):
            for asset in Asset.objects.all():
                click.echo(f"{asset.assetName}:")
                currStandardizedVersion = "01.00.00"
                for commit in Commit.objects.filter(asset=asset).order_by('version'):
                    oldVers = commit.version
                    if not re.match(r"^\d{2}\.00\.00$", oldVers):
                        commit.version = currStandardizedVersion
                        commit.save()
                        print(f"    Fixing... Old version: {oldVers}, standardized version: {commit.version}")
                    currStandardizedVersion = f"0{int(currStandardizedVersion[1]) + 1}.00.00"

                click.echo(f"   {asset.assetName} is clear!")

        if click.confirm('Clearing sublayers list of all commit objects. Do you want to continue?'):
            for commit in Commit.objects.all():
                if len(commit.sublayers.all()) != 0:
                    click.echo(f"Clearing commit sublayers of {commit.asset.assetName}, version {commit.version}...")
                    commit.sublayers.clear()
                    click.echo("Successful")

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



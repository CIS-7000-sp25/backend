from django.core.management.base import BaseCommand
from library.models import Asset, Commit
from datetime import datetime, timezone, timedelta
import re
import click

DT_FMT="%Y-%m-%d %H:%M:%S%:z"

class Command(BaseCommand):
    help = """Easily refactor Commit objects in database."""

    def handle(self, *args, **options):
        print(options)

        if click.confirm(f"Fixing timestamp-related commit history. Continue?"):
            self.fixCommitTimestamps()
        if click.confirm('Refactoring 1.x commit versions to 0x.00.00 versions. Continue?'):
            self.standardizeCommitVersionSyntax()
        if click.confirm('Clearing sublayers list of all commit objects. Continue?'):
            self.clearCommitSublayers()
        if click.confirm(f"WARNING: This shouldn't be ran more than once. Adding a new commit for our standardized USD structure. Continue?"):
            self.addNewCommit()
    
    def fixCommitTimestamps(self):
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
            print(f"{asset.assetName} is clear!")

    def standardizeCommitVersionSyntax(self):
        for asset in Asset.objects.all():
            print(f"{asset.assetName}:")
            currStandardizedVersion = "01.00.00"
            for commit in Commit.objects.filter(asset=asset).order_by('version'):
                oldVers = commit.version
                if not re.match(r"^\d{2}\.00\.00$", oldVers):
                    commit.version = currStandardizedVersion
                    commit.save()
                    print(f"    Fixing... Old version: {oldVers}, standardized version: {commit.version}")
                currStandardizedVersion = f"0{int(currStandardizedVersion[1]) + 1}.00.00"
            print(f"   {asset.assetName} is clear!")
    
    def clearCommitSublayers(self):
        for commit in Commit.objects.all():
            if len(commit.sublayers.all()) != 0:
                print(f"Clearing commit sublayers of {commit.asset.assetName}, version {commit.version}...")
                commit.sublayers.clear()
                print("Successful")

    def addNewCommit(self):
        for asset in Asset.objects.all():
            latestCommitVersion = Commit.objects.filter(asset=asset).order_by("-version")[0].version
            nextVersion = f"0{int(latestCommitVersion[1]) + 1}.00.00"

            nextAuthor = Commit.objects.filter(asset=asset).order_by("version")[0].author # make author of this commit the original author

            nextTimestamp = datetime.now().replace(tzinfo=timezone.utc).strftime(DT_FMT)
            nextNote = "Standardize assets to final project USD structure."

            nextCommit = Commit(asset=asset, 
                                version=nextVersion, 
                                author=nextAuthor, 
                                timestamp=nextTimestamp,
                                note=nextNote)
            
            nextCommit.save()
            print(f"Created new commit for {asset.assetName} with version {nextCommit.version} and timestamp {nextCommit.timestamp}")

    suppressed_base_arguments = ["--version", "--verbosity", "--settings", "--pythonpath", "--traceback", "--no-color", "--force-color", "--skip-checks"]



from django.core.management.base import BaseCommand
from library.models import Asset, Commit, Sublayer, StatusTag
from library.utils.s3_utils import S3Manager
from typing import List
import click
import os

from django.conf import settings

DT_FMT="%m-%d-%Y %H:%M:%S%:z"

ASSETS_2024 = ["carrot", "mug", "paniniPress", "sushi", "wineGlass", "kitchenaid", "oldTelevision", "penTablet", "flatTeapot", "woodenChair"]
STATUS_TAGS = ["acquired", "approved", "standardized", "latest"]

class Command(BaseCommand):
    help = """Easily refactor Sublayer objects in database."""

    def handle(self, *args, **options):
        print(options)

        if click.confirm(f"Resetting sublayers for latest commit. Continue?"):
            self.resetMostRecentSublayers()
        if click.confirm(f"Resetting thumbnail paths. Continue?"):
            self.resetAllThumbnailKeys()
        if click.confirm(f"Clearing S3 bucket. Are you sure you want to continue?"):
            self.clearS3Bucket()
        if click.confirm("Clearing existing Sublayer objects with outdated column data from database. Continue?"):
            self.clearOldSublayers()
        if click.confirm(f"Creating all StatusTag objects. In the future, options will be {STATUS_TAGS}. Continue?"):
            self.createStatusTags()
        if click.confirm(f"Creating sublayers for all currently known commits. Continue?"):
            self.createSublayersForAllCommits()
        if click.confirm(f"Print asset commit sublayers for a sanity check?"):
            self.sanityCheck()
    
    def clearOldSublayers(self):
        Sublayer.objects.all().delete()
        if len(Sublayer.objects.all()) == 0:
            print("Done!")

    def createStatusTags(self):     
        for tag in STATUS_TAGS:
            st = StatusTag(statusTag=tag)
            try:
                st.save()
                print(f"StatusTag object for '{tag}' has been created")
            except Exception as _:
                print(f"Error! StatusTag object for '{tag}' already exists")

    def createSublayersForAllCommits(self):
        
        s3 = S3Manager()

        for asset in Asset.objects.all():
            for i, commit in enumerate(Commit.objects.filter(asset=asset).order_by("-version")[:4]):
                commit_sublayers: List[Sublayer] = []

                bucket = "usd-asset-versions-dump"
                prefix = ""
                curr_status_list = []
                if i == 3:
                    if asset.assetName not in ASSETS_2024:
                        prefix = f"2025-assets-01.00.00/{asset.assetName}/"
                        curr_status_list = ["acquired"]
                elif i == 2:
                    if asset.assetName not in ASSETS_2024:
                        prefix = f"2025-assets-02.00.00/{asset.assetName}/"
                        # status_list is empty
                elif i == 1:
                    if asset.assetName not in ASSETS_2024:
                        prefix = f"2025-assets-03.00.00/{asset.assetName}/"
                        # status_list is empty
                    else: # 2024 asset has this data
                        prefix = f"2024-assets-acquisition/{asset.assetName}/"
                        curr_status_list = ["acquired"]
                elif i == 0:
                    bucket = "cis-7000-usd-assets-versioned"
                    prefix = f"Assets/{asset.assetName}/"
                    curr_status_list = ["approved", "standardized"]

                if prefix != "":
                    s3_filepaths = s3.list_s3_files(prefix, bucket)

                    for filepath in s3_filepaths:
                        sl_sublayerName = filepath.rsplit('/', 1)[-1]
                        
                        if (sl_sublayerName == ".DS_Store"): # Death to all .DS_Store!!
                            s3.delete_object(filepath, bucket)
                            continue

                        sl_filepath = os.path.join(bucket, filepath)
                        sl_s3_versionID = s3.get_s3_versionID(key=filepath, bucket=bucket, latest=True)
                        sl_version = commit.version

                        sublayer = Sublayer(sublayerName=sl_sublayerName, 
                                            filepath=sl_filepath, 
                                            s3_versionID=sl_s3_versionID,
                                            version=sl_version,
                                            asset=asset)
                        
                        print(f"Creating sublayer... {sublayer} - {sublayer.version}")
                        sublayer.save()
                        
                        if len(curr_status_list) != 0:
                            sl_status = []
                            for s in curr_status_list:
                                status_obj = StatusTag.objects.get(statusTag=s)
                                if status_obj:
                                    sl_status.append(status_obj)
                                else:
                                    raise Exception(f"StatusTag {s} expected but not found.")
                                
                            sublayer.status.set(sl_status)
                            sublayer.save()

                        commit_sublayers.append(sublayer)

                    commit.sublayers.set(commit_sublayers)
                    commit.save()
                    print(f"Setting sublayers for {asset.assetName} commit {commit.version}...")
                    print(f"It now contains:")
                    for sublayer in commit.sublayers.all():
                        print(f"    {sublayer.sublayerName}")

    def sanityCheck(self):
        for asset in Asset.objects.all():
            print(asset.assetName)
            for commit in Commit.objects.filter(asset=asset).order_by("version"):
                print(f"    {commit.version}")
                for sublayer in commit.sublayers.all():
                    
                    print(f"        {sublayer} ({sublayer.filepath})") if len(sublayer.filepath) < 70 else print(f"        {sublayer} (...{sublayer.filepath[-70:]})")
    
    def resetMostRecentSublayers(self):
        s3 = S3Manager()

        for asset in Asset.objects.all():
            for i, sublayer in enumerate(Sublayer.objects.filter(asset=asset).order_by("-version")):
                n = -1
                all_sl_versions = Sublayer.objects.filter(filepath=sublayer.filepath).order_by("-version")
                if not all_sl_versions:
                    continue
                for j, sl in enumerate(all_sl_versions):
                    if sl == sublayer:
                        n = j
                        break

                bucket = sublayer.filepath.split("/", 1)[0]

                s3_filepath = sublayer.filepath.split("/", 1)[1]
                s3_versionID = s3.get_s3_versionID(key=s3_filepath, bucket=bucket, n=n+1)

                sl_s3_versionID = sublayer.s3_versionID
                if s3_versionID == sl_s3_versionID:
                    continue

                sublayer.s3_versionID = s3_versionID

                print(sublayer.filepath)
                print(f"Sublayer {sublayer} {sublayer.version} s3 versionID updated. Old: {sl_s3_versionID}, New: {s3_versionID}")
                # sublayer.save()

    def resetAllThumbnailKeys(self):
        for asset in Asset.objects.all():

            asset.thumbnailKey = f"{settings.AWS_BUCKET_NAME}/Assets/{asset.assetName}/contrib/.thumbs/thumbnail.png"
            print(asset.thumbnailKey)
            asset.save()

    def clearS3Bucket(self):
        s3 = S3Manager()

        l = s3.list_s3_files(prefix="", bucket=settings.AWS_BUCKET_NAME)

        for obj in l:
            s3.delete_object(obj,bucket=settings.AWS_BUCKET_NAME)
                
    suppressed_base_arguments = ["--version", "--verbosity", "--settings", "--pythonpath", "--traceback", "--no-color", "--force-color", "--skip-checks"]



from django.core.management.base import BaseCommand, CommandError
from library.models import Asset, Sublayer
from library.utils.s3_utils import S3Manager
import os
import ast

class Command(BaseCommand):
    help = ''

    def handle(self, *args, **options):
        s3 = S3Manager()
        sublayers = Sublayer.objects.all()

        for sl in sublayers:
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

            print(sl, " | ", sl.filepath, " | ", sl.s3_versionID)



from rest_framework import serializers
from library.models import Asset, Commit, Sublayer, Keyword
from library.utils.s3_utils import S3Manager
from typing import List
import zipfile
import re


# Response serializers

class SuccessResponseSerializer(serializers.Serializer):
    success = serializers.BooleanField(default=True)
    message = serializers.CharField()

class ErrorResponseSerializer(serializers.Serializer):
    success = serializers.BooleanField(default=False)
    message = serializers.CharField()


# Used in views_upload.py

class VerifySerializer(serializers.Serializer):
    file = serializers.FileField(required=True)

class CheckinSerializer(serializers.Serializer):
    file = serializers.FileField(required=True)
    note = serializers.CharField(required=True)
    version = serializers.CharField(required=True)
    hasTexture = serializers.BooleanField(required=False)
    pennkey = serializers.CharField(required=True)
    keywordsRawList = serializers.ListField(
        child=serializers.CharField(), required=False
    )

class UploadSerializer(serializers.Serializer):
    file = serializers.FileField(required=True)
    note = serializers.CharField(required=True)
    hasTexture = serializers.BooleanField(required=True)
    pennkey = serializers.CharField(required=True)
    keywordsRawList = serializers.ListField(
        child=serializers.CharField(), required=False
    )

class AssetSerializer(serializers.ModelSerializer):
    keywordsRawList = serializers.ListField(
        child=serializers.CharField(),
        write_only=True,
        required=False
    )

    class Meta:
        model = Asset
        fields = ['hasTexture', 'keywordsRawList']

    def create(self, validated_data):
        assetName = self.context.get("assetName")
        thumbnailKey = f"cis-7000-usd-assets-versioned/Assets/{assetName}/contrib/.thumbs/thumbnail.png"

        asset = Asset(assetName=assetName, thumbnailKey=thumbnailKey, hasTexture=validated_data.get("hasTexture"))
        asset.save()

        self._handle_keywords(asset, validated_data)

        return asset

    def update(self, instance: Asset, validated_data):
        # Update hasTexture if provided
        instance.hasTexture = validated_data.get('hasTexture', instance.hasTexture)
        instance.save()

        self._handle_keywords(instance, validated_data)

        return instance

    def _handle_keywords(self, asset: Asset, validated_data):
        keywordsRawList = validated_data.pop('keywordsRawList', [])

        if len(keywordsRawList) == 1 and "," in keywordsRawList[0]:
            print("Keywords given as string rather than list of strings.")
            keywordsRawList = keywordsRawList[0].split(",")
            keywordsRawList = [k.strip() for k in keywordsRawList]

        for keyword in keywordsRawList:
            keyword_obj, created = Keyword.objects.get_or_create(keyword=keyword)
            asset.keywordsList.add(keyword_obj)
            print(f"Keyword: {keyword}, was created: {created}")

    def validate_keywordsRawList(self, value):
        if not isinstance(value, list):
            raise serializers.ValidationError("keywordsRawList must be a list object.")
        for keyword in value:
            if not keyword.strip():
                raise serializers.ValidationError("Keyword entries must not be blank.")
            if len(keyword) > 200:
                raise serializers.ValidationError("Each keyword must be at most 200 characters long.")
        return value

class CommitSerializer(serializers.ModelSerializer):
    s3 = S3Manager()
    latestCommitVersion = ""
    file = serializers.FileField(required=True)

    class Meta:
        model = Commit
        fields = ['note', 'version', 'file']
                
    def create(self, validated_data):
        asset = self.context.get("asset")
        version = validated_data.get("version")
        author = self.context.get("author")
        note = validated_data.get("note")

        commit = Commit(asset=asset, author=author, note=note, version=version)
        commit.save()

        # prepare sublayers
        zip = validated_data.get('file')
        sublayers = self._create_sublayers(asset, version, zip)
        
        commit.sublayers.set(sublayers) # no additional save() necessary

        return commit
    
    def _create_sublayers(self, asset: Asset, version, zip):
        sublayers: List[Sublayer] = []
        with zipfile.ZipFile(zip) as zip_ref:
            for file_info in zip_ref.infolist():
                if file_info.is_dir():
                    continue

                if file_info.filename.startswith("__MACOSX/") or file_info.filename.endswith(".DS_Store"):
                    continue

                filepath = f"cis-7000-usd-assets-versioned/Assets/{file_info.filename}"
                sublayerName = filepath.rsplit("/", 1)[-1]
                s3_versionID = ""

                with zip_ref.open(file_info.filename) as extracted_file:
                    _splitFilepath = filepath.split("/", 1)
                    _bucket = _splitFilepath[0]
                    _key = _splitFilepath[1]

                    response = self.s3.upload_fileobj(
                        extracted_file, 
                        _key,
                        _bucket
                    )

                    s3_versionID = response["VersionId"]

                sublayer = Sublayer(asset=asset, version=version, filepath=filepath, sublayerName=sublayerName, s3_versionID=s3_versionID)
                sublayer.save()

                previousVersion = None
                if self.latestCommitVersion != "":
                    try:
                        previousVersion = Sublayer.objects.get(asset=asset, filepath=filepath, version=self.latestCommitVersion)
                        print(f"Sublayer has previous version: {previousVersion}")
                    except Sublayer.DoesNotExist:
                        try:
                            previousVersion = Sublayer.objects.filter(asset=asset, filepath=filepath).order_by("-version")[0]
                            print(f"Sublayer has previous version: {previousVersion}")
                        except Exception:
                            print("Sublayer does not have previous version.")

                if previousVersion:
                    sublayer.previousVersion = previousVersion
                    sublayer.save()

                sublayers.append(sublayer)

        return sublayers
    
    def validate_version(self, value):
        if not re.match(r"^\d{2}\.\d{2}\.\d{2}$", value):
            raise serializers.ValidationError(
                "Version must match format XX.XX.XX (e.g., 04.00.01)"
            )

        asset = self.context.get("asset")
        
        assetCommits = Commit.objects.filter(asset=asset).order_by("-version")
        if len(assetCommits) > 0:
            self.latestCommitVersion = assetCommits[0].version
            if self._version_to_tuple(value) <= self._version_to_tuple(self.latestCommitVersion):
                raise serializers.ValidationError(
                    "Requested commit version is smaller or equal to this asset's latest version!"
                )
        return value # we are all good
    
    def _version_to_tuple(self, version_str):
        """e.g. 04.00.01" -> (4, 0, 1)"""
        return tuple(int(part) for part in version_str.split('.'))
    
# Used in views_info.py

class CommitDictSerializer(serializers.Serializer):
    id = serializers.UUIDField()
    version = serializers.CharField()
    timestamp = serializers.DateTimeField()
    authorPennkey = serializers.CharField()
    note = serializers.CharField()

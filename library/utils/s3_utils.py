import boto3
from django.conf import settings

class S3Manager:
    def __init__(self):
        self.client = boto3.client(
            's3',
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
            region_name=settings.AWS_REGION
        )
        self.bucket = settings.AWS_BUCKET_NAME
        self.resource = boto3.resource('s3')

    def generate_presigned_url(self, key, bucket="cis-7000-usd-assets-versioned", expires_in=60):
        return self.client.generate_presigned_url(
            'get_object',
            Params={'Bucket': bucket, 'Key': key}, # relative path to bucket
            ExpiresIn=expires_in
        )
    
    def update_file(self, file, key, bucket="cis-7000-usd-assets-versioned"):
        """Better for small objects. Returns response which contains versionID as response.get('VersionId)"""
        return self.client.put_object(Body=file, Bucket=bucket, Key=key)

    def upload_fileobj(self, file, key, bucket="cis-7000-usd-assets-versioned") -> str:
        """Better for large objects. Returns response using `head_object` which contains versionID as response.get('VersionId)"""

        self.client.upload_fileobj(file, bucket, key)
        response = self.client.head_object(Bucket=bucket, Key=key)

        return response
    
    def delete_file(self, key, bucket):
        self.client.delete_object(Bucket=bucket, Key=key)

    def list_s3_files(self, prefix, bucket="cis-7000-usd-assets-versioned"):
        paginator = self.client.get_paginator('list_objects_v2')
        result = []

        for page in paginator.paginate(Bucket=bucket, Prefix=prefix):
            for obj in page.get('Contents', []):
                result.append(obj['Key'])

        return result

    def download_s3_file(self, key, bucket="cis-7000-usd-assets-versioned"):
        obj = self.client.get_object(Bucket=bucket, Key=key)
        return obj['Body'].read()  # this returns bytes
    
    def get_s3_versionID(self, key, bucket="cis-7000-usd-assets-versioned", latest=True):
        resp = self.client.list_object_versions(Prefix=key, Bucket=bucket)

        for obj in [*resp['Versions'], *resp.get('DeleteMarkers', [])]:
            if latest:
                if obj['IsLatest']:
                    return obj['VersionId']
        
    def delete_object(self, key, bucket="cis-7000-usd-assets-versioned"):
        """PLEASE be confident before you use!"""
        self.client.delete_object(Bucket=bucket, Key=key)

    def thumbnail_key_to_url(self, thumbnailKey, expires_in=60):
        _splitThumbnailKey = thumbnailKey.split("/", 1)
        _bucket = _splitThumbnailKey[0]
        _key = _splitThumbnailKey[1]
        
        return self.client.generate_presigned_url(
            'get_object',
            Params={'Bucket': _bucket, 'Key': _key}, # relative path to bucket
            ExpiresIn=expires_in
        )
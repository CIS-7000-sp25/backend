import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime, timezone

DT_FMT="%Y-%m-%d %H:%M:%S%:z"

# Create your models here.

class Keyword(models.Model):
    keyword = models.CharField(max_length=200, unique=True, default="")

    def __str__(self):
        return self.keyword

class StatusTag(models.Model):
    statusTag = models.CharField(max_length=200, unique=True, default="")

    def __str__(self):
        return self.statusTag
    
class Author(AbstractUser):
    firstName= models.CharField(max_length=200, default="")
    lastName= models.CharField(max_length=200, default="")
    email= models.CharField(max_length=200, default="")

    @property
    def pennkey(self):
        return self.username
    
    def __str__(self):
        return f"{self.firstName} {self.lastName} ({self.pennkey})"
    
class Asset(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    assetName = models.CharField(max_length=200)
    keywordsList = models.ManyToManyField(Keyword)
    hasTexture = models.BooleanField(default=False)
    # DEPRECATED: use checkedOutBy in Sublayer instead
    checkedOutBy = models.ForeignKey(Author, on_delete=models.SET_NULL, null=True, blank=True)
    thumbnailKey = models.CharField(max_length=200, blank=True, null=True)
    
    def __str__(self):
        return self.assetName

    
class Sublayer(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    version = models.CharField(max_length=32, db_index=True)
    s3_versionID = models.CharField(max_length=64, null=True, blank=True)
    sublayerName = models.CharField(max_length=200)
    checkedOutBy = models.ForeignKey(Author, on_delete=models.SET_NULL, null=True, blank=True)
    filepath = models.CharField(max_length=200, db_index=True)
    asset = models.ForeignKey(Asset, on_delete=models.CASCADE)
    internalDependencies = models.ManyToManyField('self', blank=True, symmetrical=False, related_name='internal_dependents')
    externalDependencies = models.ManyToManyField(Asset, blank=True, related_name='dependents')
    status = models.ManyToManyField(StatusTag, blank=True)
    previousVersion = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True, related_name='futureVersions')

    def __str__(self):
        return f"{self.sublayerName} - {self.asset.assetName}"

class Commit(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    author = models.ForeignKey(Author, on_delete=models.SET_NULL, null=True, blank=True, related_name='commits')
    version = models.CharField(max_length=32, db_index=True)
    timestamp = models.DateTimeField(default=datetime.now().replace(tzinfo=timezone.utc).strftime(DT_FMT), db_index=True)
    note = models.TextField()
    sublayers = models.ManyToManyField(Sublayer, blank=True)
    asset = models.ForeignKey(Asset, on_delete=models.CASCADE, related_name='commits')

    def __str__(self):
        return f"{self.version} - {self.asset.assetName}"
    
    def to_dict(self):
        return {
            "id": self.id,
            "authorPennkey": self.author.pennkey,
            "version": self.version,
            "timestamp": self.timestamp,
            "note": self.note
        }
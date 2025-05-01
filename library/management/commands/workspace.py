from library.models import Sublayer, Commit, Asset
from library.utils.s3_utils import S3Manager
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    help = """A document to create temporary scripts that interact with the Django project."""

    def handle(self, *args, **options):
        s3 = S3Manager()

        
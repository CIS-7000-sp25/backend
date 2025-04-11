from django.test import TestCase
from pxr import Usd, UsdGeom, Sdf

# Create your tests here.
class UsdTest(TestCase):
    
    def __init__(self, usdaFileData: bytes):
        self.stage = Usd.Stage.CreateInMemory()
        self.stage.GetRootLayer().ImportFromString()

    def checkBoundingBox(self) -> bool:
        prim = self.stage.GetPrimAtPath("\campfire_LOD0\logs")
        



    # pip install pytest usd-core
    # add to requirements.txt
    # from pytest import unittest
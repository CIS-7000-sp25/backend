# conftest.py

import pytest
from pxr import Usd
from pathlib import Path
import os
import sys

library_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

print(f"📁 Adding to sys.path: {library_path}")
sys.path.append(library_path)

# Debugging output for sys.path
print("sys.path:", sys.path)

@pytest.fixture(scope="session")
def asset_root():
    return Path("../assets/")

def collect_usda_files(root_path):
    results = []
    for dirpath, _, filenames in os.walk(root_path):
        for filename in filenames:
            if filename.endswith(".usda"):
                full_path = Path(dirpath) / filename
                relative = full_path.relative_to(root_path)
                is_top_level = (
                    len(relative.parts) == 2 and
                    relative.parts[0] == relative.stem
                )
                results.append((full_path, is_top_level))
    return results

@pytest.fixture(scope="session")
def all_usd_files(asset_root):
    files = collect_usda_files(asset_root)
    if not files:
        pytest.skip("🛘 No USD files found to test", allow_module_level=True)
    return files

@pytest.fixture(scope="session")
def nested_usd_files(all_usd_files):
    return [f for f, is_top in all_usd_files if not is_top]

@pytest.fixture
def open_stage():
    def _open(file_path):
        try:
            return Usd.Stage.Open(str(file_path))
        except Exception as e:
            raise AssertionError(f"❌ Failed to open {file_path}: {e}")
    return _open

@pytest.fixture(scope="session")
def asset_folders(asset_root):
    """Fixture to collect all asset folder names under ASSET_ROOT."""
    return [folder.name for folder in asset_root.iterdir() if folder.is_dir()]

# Create your tests here.
# class UsdTest(TestCase):

#     def __init__(self, usdaFileData: bytes):
#         super().__init__()
#         self.stage = Usd.Stage.CreateInMemory()
#         self.stage.GetRootLayer().ImportFromString(usdaFileData)
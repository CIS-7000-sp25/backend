import os
import pytest
from pathlib import Path


def check_directory_structure(base_path, expected_structure):
    """Recursively check directory structure against expected structure."""
    for name, content in expected_structure.items():
        current_path = base_path / name

        # Check if the directory exists
        assert current_path.exists(), f"❌ {current_path} does not exist."

        if isinstance(content, dict):  # If content is a subdirectory
            check_directory_structure(current_path, content)
        else:
            for file_name in content:  # If content is a list of files
                file_path = current_path / file_name
                assert file_path.exists(), f"❌ {file_path} does not exist."


def generate_expected_structure(asset_name):
    """Generate expected directory structure based on asset name (folder name)."""
    base_structure = {
        f"{asset_name}.usda": [],  # Root file, may change based on asset
        "contrib": {
            "geometry": {
                "geometry.usda": [],
                "bbox": {
                    "geometry_bbox.usda": []
                },
                "LOD0": {
                    "geometry_LOD0.usda": []
                },
                "LOD1": {
                    "geometry_LOD1.usda": []
                },
                "LOD2": {
                    "geometry_LOD2.usda": []
                },
            },
            "material": {
                "material.usda": [],
                "default": {
                    "material_default.usda": [],
                    "texture": {
                        "default.png": []
                    },
                },
            }
        }
    }

    return base_structure


def test_usd_structure(asset_folders, asset_root):
    """Test to check the directory structure of each asset folder."""
    for asset_name in asset_folders:
        base_path = asset_root / asset_name  # Get the path for the asset folder

        if base_path.exists():
            expected_structure = generate_expected_structure(asset_name)
            check_directory_structure(base_path, expected_structure)
        else:
            pytest.fail(f"❌ {base_path} does not exist.")
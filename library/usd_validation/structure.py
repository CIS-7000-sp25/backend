from pathlib import Path

def check_directory_structure(base_path: Path, expected_structure: dict):
    """Recursively check directory structure against expected structure."""
    for name, content in expected_structure.items():
        current_path = base_path / name

        # Check if the directory or file exists
        assert current_path.exists(), f"{current_path} does not exist."

        if isinstance(content, dict):  # Subdirectory
            check_directory_structure(current_path, content)
        else:  # List of files
            for file_name in content:
                file_path = current_path / file_name
                assert file_path.exists(), f"{file_path} does not exist."


def generate_expected_structure(asset_name: str) -> dict:
    """Generate expected directory structure based on asset name (folder name)."""
    return {
        f"{asset_name}.usda": [],
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

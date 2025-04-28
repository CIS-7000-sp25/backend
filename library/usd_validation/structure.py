from pathlib import Path

def check_usd_structure(stage, file_name: str, temp_dir: Path, name: str):
    """Checks that the extracted asset has the expected folder and file structure."""

    asset_name = Path(file_name).parts[0]
    base_path = temp_dir / asset_name

    if not base_path.exists():
        raise AssertionError(f"{base_path} does not exist.")
    
    if (asset_name != name):
        raise AssertionError(f"USD file name {asset_name} does not match expected asset name {name}.")

    expected_structure = generate_expected_structure(asset_name)
    check_directory_structure(base_path, expected_structure)

def check_directory_structure(base_path: Path, expected_structure: dict, valid_extensions=('.usd', '.usda', '.usdc', '.png', '.glb')):
    """Recursively check directory structure against expected structure."""
    for name, content in expected_structure.items():
        current_path = base_path / name

        if isinstance(content, dict):
            relative_path = current_path.relative_to(base_path)
            assert current_path.is_dir(), f"Missing folder: {relative_path}"
            check_directory_structure(current_path, content, valid_extensions)
        elif isinstance(content, list):
            found = False
            for ext in valid_extensions:
                possible_file = current_path.with_suffix(ext)
                if possible_file.exists():
                    found = True
                    break
            if not found:
                relative_file = current_path.relative_to(base_path)
                raise AssertionError(f"Missing file: {relative_file}")
        else:
            raise ValueError(f"Unexpected content type at {current_path}: {type(content)}")


def generate_expected_structure(asset_name: str) -> dict:
    """Generate expected directory structure based on asset name (folder name)."""
    return {
        f"{asset_name}": [],
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
            },
            ".thumbs":{
                "thumbnail.png": [],
            },
            ".cache": {
                f"{asset_name}.glb": [],
            }
        }
    }


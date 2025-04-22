from pathlib import Path

def check_usd_structure(stage, file_name: str, temp_dir: Path):
    """Checks that the extracted asset has the expected folder and file structure."""

    # Get the asset name (e.g., "campfire" from "campfire/campfire.usda")
    asset_name = Path(file_name).parts[0]
    base_path = temp_dir / asset_name

    if not base_path.exists():
        raise AssertionError(f"❌ {base_path} does not exist.")

    expected_structure = generate_expected_structure(asset_name)
    check_directory_structure(base_path, expected_structure)

def check_directory_structure(base_path: Path, expected_structure: dict, valid_extensions=('.usd', '.usda')):
    """Recursively check directory structure against expected structure."""
    for name, content in expected_structure.items():
        current_path = base_path / name

        if isinstance(content, dict):  # Subdirectory
            relative_path = current_path.relative_to(base_path)
            assert current_path.exists(), f"❌ Missing folder: {relative_path}"
            check_directory_structure(current_path, content, valid_extensions)
        else:  # List of acceptable file names (without extensions)
            for base_file_name in content:
                expected_paths = [current_path / f"{base_file_name}{ext}" for ext in valid_extensions]
                found = any(p.exists() for p in expected_paths)

                example_path = expected_paths[0].relative_to(base_path)
                location = example_path.parent if example_path.parent != Path('.') else "root directory"
                assert found, f"❌ Missing file: {example_path.stem} with one of {valid_extensions} in {location}"


def generate_expected_structure(asset_name: str) -> dict:
    """Generate expected directory structure based on asset name (folder name)."""
    return {
        "": [asset_name],
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

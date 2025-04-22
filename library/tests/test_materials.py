
from usd_validation.materials import (
    check_usd_materials,
    check_has_default_variant_sets,
)

def test_usd_materials(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        check_usd_materials(stage, file_path)

def test_material_defaults_variant(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        check_has_default_variant_sets(stage, file_path)

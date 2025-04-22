from usd_validation.core import check_usd_properties

def test_usd_properties(all_usd_files, open_stage):
    """Check upAxis, metersPerUnit, and default prim for top-level assets."""
    for file_path, is_top_level in all_usd_files:
        if is_top_level:
            stage = open_stage(file_path)
            check_usd_properties(stage, file_path)
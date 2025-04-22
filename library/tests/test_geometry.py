from usd_validation.geometry import check_usd_geometry

def test_usd_geometry(all_usd_files, open_stage):
    """Test to check all aspects of USD geometry."""
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)
        check_usd_geometry(stage, file_path)
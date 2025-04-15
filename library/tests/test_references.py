from pathlib import Path

def test_root_prim_exists(all_usd_files, open_stage):
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)
        assert stage.GetDefaultPrim(), f"❌ {file_path} has no default prim!"


def test_no_invalid_references(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            references = prim.GetMetadata('references')
            if references:
                for ref in references.GetAddedOrExplicitItems():
                    ref_path = Path(file_path.parent / ref.assetPath)
                    assert ref_path.exists(), f"❌ Reference missing: {ref.assetPath} in {file_path}"

from pathlib import Path

def check_usd_references(stage, file_path, temp_dir):
    check_no_invalid_references(stage, file_path, temp_dir)


def check_no_invalid_references(stage, file_path, temp_dir):
    extraction_path = Path(temp_dir) / file_path.parent
    
    for prim in stage.Traverse():
        references = prim.GetMetadata('references')
        
        if references:
            for ref in references.GetAddedOrExplicitItems():
                ref_path = extraction_path / ref.assetPath.lstrip('./')
                
                assert ref_path.exists(), f"Reference missing: {ref.assetPath} in {file_path}"

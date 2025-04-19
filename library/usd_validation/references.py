from pathlib import Path

def check_usd_references(stage, file_path):
    check_no_invalid_references(stage, file_path)
    
def check_no_invalid_references(stage, file_path):
    for prim in stage.Traverse():
        references = prim.GetMetadata('references')
        if references:
            for ref in references.GetAddedOrExplicitItems():
                ref_path = Path(file_path).parent / ref.assetPath
                assert ref_path.exists(), f"Reference missing: {ref.assetPath} in {file_path}"

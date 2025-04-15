from pxr import UsdShade

def test_materials_are_bound(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            if prim.GetTypeName() == "Mesh":
                binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
                assert binding, f"❌ Mesh {prim.GetPath()} has no material bound in {file_path}"

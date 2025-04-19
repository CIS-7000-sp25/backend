from pxr import UsdShade

def check_usd_materials(stage, file_name):
    check_materials_are_bound(stage, file_name)

def check_materials_are_bound(stage, file_name):
    for prim in stage.Traverse():
        if prim.GetTypeName() == "Mesh":
            binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
            assert binding, f"Mesh {prim.GetPath()} has no material bound in {file_name}"
from pxr import UsdShade, Usd
import os

def check_usd_materials(stage, file_name):
    check_materials_are_bound(stage, file_name)
    # check_has_default_variant_sets(stage, file_name)

def check_materials_are_bound(stage, file_name):
    for prim in stage.Traverse():
        if prim.GetTypeName() == "Mesh":
            binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
            assert binding, f"❌ Mesh {prim.GetPath()} has no material bound in {file_name}"

def check_has_default_variant_sets(stage, file_name):
    normalized_path = os.path.normpath(file_name).lower()
    if not normalized_path.endswith(f"{os.sep}material.usda"):
        return

    for prim in stage.Traverse():
        if prim.GetName() == "Materials" and prim.GetTypeName() == "Scope":
            variant_sets = prim.GetVariantSets()
            names = variant_sets.GetNames()
            assert len(names) >= 1, (
                f"❌ Expected at least 1 variant set under 'Materials', "
                f"but found {len(names)} in {file_name}"
            )

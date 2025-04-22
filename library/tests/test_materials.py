from pxr import UsdShade
import os

def test_materials_are_bound(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            if prim.GetTypeName() == "Mesh":
                binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
                assert binding, f"❌ Mesh {prim.GetPath()} has no material bound in {file_path}"

def test_has_default_variant_sets(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        normalized_path = os.path.normpath(file_path).lower()
        if not normalized_path.endswith(f"{os.sep}material.usda"):
            continue
        stage = open_stage(file_path)
        hasMaterialScope = False
        for prim in stage.Traverse():
            if prim.GetName() == "Materials" and prim.GetTypeName() == "Scope":
                hasMaterialScope = True
                variant_sets = prim.GetVariantSets()
                names = variant_sets.GetNames()
                assert len(names) >= 1, f"Expected at least 1 variant set, but found {len(names)} in {file_path}"

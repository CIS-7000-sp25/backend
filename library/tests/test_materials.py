from pxr import UsdShade

def test_materials_are_bound(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            if prim.GetTypeName() == "Mesh":
                binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
                assert binding, f"❌ Mesh {prim.GetPath()} has no material bound in {file_path}"

# def test_has_default_variant_sets(nested_usd_files, open_stage):
#     for file_path in nested_usd_files:
#         stage = open_stage(file_path)
#         hasMaterialClassesScope = False
#         for prim in stage.Traverse():
#             if prim.GetName() == "MaterialClasses" and prim.GetTypeName() == "Scope":
#                 hasMaterialClassesScope = True
#                 variant_sets = prim.GetVariantSets()
#                 names = variant_sets.GetNames()
#                 assert len(names) == 2, f"has {len(names)} num variant sets)"
                
#         assert hasMaterialClassesScope, f"No Scope named 'MaterialClasses' found in {file_path}"
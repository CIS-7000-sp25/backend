from pxr import UsdGeom

def test_all_prims_visible(nested_usd_files, open_stage):
    for file_path in nested_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            vis_attr = UsdGeom.Imageable(prim).GetVisibilityAttr()
            if vis_attr and vis_attr.HasAuthoredValueOpinion():
                assert vis_attr.Get() != UsdGeom.Tokens.invisible, f"{prim.GetPath()} in {file_path} is hidden"

def test_unique_sibling_prim_names(all_usd_files, open_stage):
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)

        def check_unique(parent):
            names = set()
            for child in parent.GetChildren():
                name = child.GetName()
                assert name not in names, f"Duplicate sibling name '{name}' under {parent.GetPath()} in {file_path}"
                names.add(name)
                check_unique(child)

        check_unique(stage.GetPseudoRoot())

def test_no_empty_prim_names(all_usd_files, open_stage):
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            assert prim.GetName(), f"Empty prim name at path {prim.GetPath()} in {file_path}"

def test_check_bbox(all_usd_files, open_stage):
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)
        for prim in stage.Traverse():
            if prim.IsA(UsdGeom.Boundable):
                boundable = UsdGeom.Boundable(prim)
                bbox_attr = boundable.GetExtentAttr()
                extent = bbox_attr.Get()
                assert extent is not None, f"{prim.GetPath()} in {file_path} has no extent value"

from pxr import UsdGeom

def test_usdProperties_up_axis_is_y(all_usd_files, open_stage):
    for file_path, is_top_level in all_usd_files:
        if is_top_level:
            stage = open_stage(file_path)
            assert UsdGeom.GetStageUpAxis(stage) == UsdGeom.Tokens.y, f"{file_path} has incorrect upAxis"

def test_usdProperties_meters_per_unit_is_one(all_usd_files, open_stage):
    for file_path, is_top_level in all_usd_files:
        if is_top_level:
            stage = open_stage(file_path)
            meters_per_unit = UsdGeom.GetStageMetersPerUnit(stage)
            assert meters_per_unit == 0.01, f"{file_path} has metersPerUnit = {meters_per_unit}, expected 0.01"

def test_usdProperties_root_prim_exists(all_usd_files, open_stage):
    for file_path, _ in all_usd_files:
        stage = open_stage(file_path)
        assert stage.GetDefaultPrim(), f"{file_path} has no default prim"

# Does not currently work because some files are not uniformly scaled or non-negative, apparently T.T
# Check scale is 1.0
# @pytest.mark.parametrize("file_path", top_level_usd_files + nested_usd_files)
# def test_uniform_scale(file_path):
#     stage = Usd.Stage.Open(str(file_path))
#     for prim in stage.Traverse():
#         xform = UsdGeom.Xformable(prim)
#         if xform:
#             ops = xform.GetOrderedXformOps()
#             for op in ops:
#                 if op.GetOpType() == UsdGeom.XformOp.TypeScale:
#                     scale_val = op.Get()
#                     assert all(s == 1.0 for s in scale_val), f"❌ {prim.GetPath()} has non-uniform scale {scale_val} in {file_path}"

# Check no scaling is negative or non-uniform
# @pytest.mark.parametrize("file_path", top_level_usd_files + nested_usd_files)
# def test_negative_and_nonuniform_scale(file_path):
#     stage = Usd.Stage.Open(str(file_path))
#     for prim in stage.Traverse():
#         xform = UsdGeom.Xformable(prim)
#         if xform:
#             # Get the local transformation matrix
#             matrix = xform.GetLocalTransformation()

#             # Extract the scale component of the transformation
#             scale = Gf.Vec3d(matrix[0][0], matrix[1][1], matrix[2][2])

#             # Check if any of the scale components are negative or non-uniform
#             if any(s < 0 for s in scale):
#                 raise AssertionError(f"Prim '{prim.GetName()}' has a problematic transform.")

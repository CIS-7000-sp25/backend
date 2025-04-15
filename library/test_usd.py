import subprocess
import pytest
from pxr import Usd, UsdGeom, UsdShade
from pathlib import Path
import os

ASSET_ROOT = Path("assets/")
print(f"📂 Looking for USD files in: {ASSET_ROOT.resolve()}")

def open_stage(file_path):
    try:
        return Usd.Stage.Open(str(file_path))
    except Exception as e:
        raise AssertionError(f"❌ Failed to open {file_path}: {e}")

def collect_usda_files(root_path):
    results = []
    for dirpath, _, filenames in os.walk(root_path):
        for filename in filenames:
            if filename.endswith(".usda"):
                full_path = Path(dirpath) / filename
                relative = full_path.relative_to(root_path)
                is_top_level = (
                    len(relative.parts) == 2 and
                    relative.parts[0] == relative.stem
                )
                results.append((full_path, is_top_level))
    return results

all_usd_files = collect_usda_files(ASSET_ROOT)

if not all_usd_files:
    pytest.skip("🛘 No USD files found to test", allow_module_level=True)

nested_usd_files = [f for f, is_top in all_usd_files if not is_top]

def run_usdchecker(file_path):
    result = subprocess.run(["usdchecker", str(file_path)], capture_output=True, text=True)
    return result.returncode, result.stderr

@pytest.mark.parametrize("file_path,is_top_level", all_usd_files)
def test_usd_file_is_valid(file_path, is_top_level):
    code, stderr = run_usdchecker(file_path)
    if code != 0:
        if not is_top_level:
            ignore = ["upAxis", "metersPerUnit"]
            filtered = [line for line in stderr.splitlines() if not any(err in line for err in ignore)]
            if filtered:
                raise AssertionError(f"❌ {file_path.name} failed:\n" + "\n".join(filtered))
        else:
            raise AssertionError(f"❌ {file_path.name} failed validation:\n{stderr}")

@pytest.mark.parametrize("file_path,is_top_level", all_usd_files)
def test_usd_up_axis_is_y(file_path, is_top_level):
    if is_top_level:
        stage = open_stage(file_path)
        assert UsdGeom.GetStageUpAxis(stage) == UsdGeom.Tokens.y, f"❌ {file_path} has incorrect upAxis"

@pytest.mark.parametrize("file_path,is_top_level", all_usd_files)
def test_usd_meters_per_unit_is_one(file_path, is_top_level):
    if is_top_level:
        print(f"🔍 Checking metersPerUnit for: {file_path}")
        stage = open_stage(file_path)
        meters_per_unit = UsdGeom.GetStageMetersPerUnit(stage)
        assert meters_per_unit == 0.01, f"❌ {file_path} has metersPerUnit = {meters_per_unit}, expected 0.01"

@pytest.mark.parametrize("file_path,_", all_usd_files)
def test_root_prim_exists(file_path, _):
    stage = open_stage(file_path)
    root_layer = stage.GetDefaultPrim()
    assert root_layer, f"❌ {file_path} has no default/root prim set!"

@pytest.mark.parametrize("file_path", nested_usd_files)
def test_all_prims_visible(file_path):
    stage = open_stage(file_path)
    for prim in stage.Traverse():
        vis_attr = UsdGeom.Imageable(prim).GetVisibilityAttr()
        if vis_attr and vis_attr.HasAuthoredValueOpinion():
            visibility = vis_attr.Get()
            assert visibility != UsdGeom.Tokens.invisible, f"❌ {prim.GetPath()} in {file_path} is hidden"

@pytest.mark.parametrize("file_path", nested_usd_files)
def test_materials_are_bound(file_path):
    stage = open_stage(file_path)
    for prim in stage.Traverse():
        if prim.GetTypeName() == 'Mesh':
            binding = UsdShade.MaterialBindingAPI(prim).GetDirectBinding()
            assert binding, f"❌ Mesh {prim.GetPath()} has no material bound in {file_path}"

@pytest.mark.parametrize("file_path", nested_usd_files)
def test_no_invalid_references(file_path):
    stage = open_stage(file_path)
    for prim in stage.Traverse():
        references = prim.GetMetadata('references')
        if references:
            for ref in references.GetAddedOrExplicitItems():
                ref_path = Path(file_path.parent / ref.assetPath)
                assert ref_path.exists(), f"❌ Reference missing: {ref.assetPath} in {file_path}"


# Create your tests here.
# class UsdTest(TestCase):

#     def __init__(self, usdaFileData: bytes):
#         super().__init__()
#         self.stage = Usd.Stage.CreateInMemory()
#         self.stage.GetRootLayer().ImportFromString(usdaFileData)

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

# usd_validators.py

from pxr import Usd, UsdGeom

def check_up_axis_is_y(stage, file_name):
    assert UsdGeom.GetStageUpAxis(stage) == UsdGeom.Tokens.y, f"{file_name} has incorrect upAxis"

def check_meters_per_unit_is_001(stage, file_name):
    meters = UsdGeom.GetStageMetersPerUnit(stage)
    assert meters == 0.01, f"{file_name} has metersPerUnit = {meters}, expected 0.01"

def check_default_prim_exists(stage, file_name):
    assert stage.GetDefaultPrim(), f"{file_name} has no default prim"

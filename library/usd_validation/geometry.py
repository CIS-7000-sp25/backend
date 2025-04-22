from pxr import UsdGeom, Gf

def check_usd_geometry(stage, file_name):
    check_all_prims_visible(stage, file_name)
    check_unique_sibling_names(stage, file_name)
    check_no_empty_prim_names(stage, file_name)
    check_bbox_extent(stage, file_name)
    check_bbox_type(stage, file_name)
    check_mesh_is_manifold(stage, file_name) 

def check_all_prims_visible(stage, file_name):
    for prim in stage.Traverse():
        vis_attr = UsdGeom.Imageable(prim).GetVisibilityAttr()
        if vis_attr and vis_attr.HasAuthoredValueOpinion():
            assert vis_attr.Get() != UsdGeom.Tokens.invisible, f"{prim.GetPath()} in {file_name} is hidden"

def check_unique_sibling_names(stage, file_name):
    def check_unique(parent):
        names = set()
        for child in parent.GetChildren():
            name = child.GetName()
            assert name not in names, f"Duplicate sibling name '{name}' under {parent.GetPath()} in {file_name}"
            names.add(name)
            check_unique(child)
    check_unique(stage.GetPseudoRoot())

def check_no_empty_prim_names(stage, file_name):
    for prim in stage.Traverse():
        assert prim.GetName(), f"Empty prim name at path {prim.GetPath()} in {file_name}"

def check_bbox_extent(stage, file_name):
    for prim in stage.Traverse():
        if prim.IsA(UsdGeom.Boundable):
            boundable = UsdGeom.Boundable(prim)
            bbox_attr = boundable.GetExtentAttr()
            extent = bbox_attr.Get()
            assert extent is not None, f"{prim.GetPath()} in {file_name} has no extent value"

def check_bbox_type(stage, file_name):
    for prim in stage.Traverse():
        if prim.IsA(UsdGeom.Boundable):
            boundable = UsdGeom.Boundable(prim)
            bbox_attr = boundable.GetExtentAttr()
            extent = bbox_attr.Get()
            for vec in extent:
                assert isinstance(vec, Gf.Vec3f), (
                    f"{prim.GetPath()} in {file_name} does not have a vec3 extent for bounding box: {extent}"
                )

def check_mesh_is_manifold(stage, file_name):
    for prim in stage.Traverse():
        if prim.IsA(UsdGeom.Mesh):
            mesh = UsdGeom.Mesh(prim)

            counts = mesh.GetFaceVertexCountsAttr().Get()
            indices = mesh.GetFaceVertexIndicesAttr().Get()

            if not counts or not indices:
                continue  # Skip empty or invalid meshes

            # A basic check: faces should not share more than two edges
            edge_map = {}
            index = 0
            for face_idx, count in enumerate(counts):
                face_indices = indices[index:index+count]
                index += count

                edges = [(face_indices[i], face_indices[(i+1) % count]) for i in range(count)]
                for v0, v1 in edges:
                    key = tuple(sorted((v0, v1)))
                    edge_map.setdefault(key, []).append(face_idx)

            # Any edge shared by more than 2 faces is non-manifold
            non_manifold_edges = [edge for edge, faces in edge_map.items() if len(faces) > 2]
            assert not non_manifold_edges, (
                f"{prim.GetPath()} in {file_name} has non-manifold edges: {non_manifold_edges[:5]}"
            )

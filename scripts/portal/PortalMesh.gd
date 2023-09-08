extends MeshInstance3D
 
class_name CamPortal
 
@export var current = false
@export var other_portal_path: NodePath

var portal_camera
var other_portal: CamPortal = null
var helper: Node3D
 
func _ready():
	helper = $helper
	if not other_portal_path.is_empty():
		other_portal = get_node(other_portal_path)
		
	portal_camera = PlayerManager.node.get_node("PortalViewports/PortalViewport/PortalCamera")
	if current:
		$Inside.visible = true
 
func _process(delta):
	if current:
		var main_cam = get_viewport().get_camera_3d()
		helper.global_transform = main_cam.global_transform
		other_portal.helper.transform = helper.transform
		portal_camera.global_transform = other_portal.helper.global_transform
		var diff = global_transform.origin - main_cam.global_transform.origin
		var angle = main_cam.global_transform.basis.z.angle_to(diff)
		var near_plane = helper.transform.origin.length()*abs(cos(angle))
		portal_camera.near = max(0.1, near_plane-4.2)
		if not visible:
			visible = true
			$Inside.visible = true
	else:
		if visible:
			visible = false
			$Inside.visible = false

func _on_teleport_area_body_entered(body):
	if not body is NodotCharacter3D:
		return
		
	if current and $Inside.visible:
		helper.global_transform = body.global_transform
		other_portal.helper.transform = helper.transform
		body.global_transform = other_portal.helper.global_transform
		current = false
	else:
		current = true
		visible = true
		
func _on_inside_area_body_exited(body):
	if not body is NodotCharacter3D:
		return
	if current and not $Inside.visible:
		$Inside.visible = true

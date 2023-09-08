extends Camera3D
 
@export var main_cam_path: NodePath
 
var main_cam: Camera3D

func _ready():
	main_cam = get_node(main_cam_path)
	
func _process(delta):
	global_transform = main_cam.global_transform

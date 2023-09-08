extends Area3D

func _ready():
	connect("body_entered", get_parent()._on_teleport_area_body_entered)
	connect("body_exited", get_parent()._on_inside_area_body_exited)

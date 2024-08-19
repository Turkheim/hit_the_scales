extends Node3D

func _on_exitarea_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		get_tree().quit()

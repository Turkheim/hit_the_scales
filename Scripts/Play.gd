extends Node3D

func _on_crossarea_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scene/Levels/gameCrossbow.tscn")

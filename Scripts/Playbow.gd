extends Node3D




func _on_bowarea_input_event(camera, event, position, normal, shape_idx):

	if event is InputEventMouseButton:
		print("click")
		get_tree().change_scene_to_file("res://Scene/Levels/gameBow.tscn")

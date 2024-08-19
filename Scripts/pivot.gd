extends Node3D

@export var degrees_per_second = 18

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(degrees_per_second) * delta)

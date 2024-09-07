extends Node3D

@export var dragon_speed = 200
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(dragon_speed) * delta)

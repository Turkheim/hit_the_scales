extends StaticBody3D
@onready var timer = $Timer
@onready var dead_scale = load("res://Scene/scaleDead.tscn")
#@onready var hit = $Hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_area_3d_body_entered(body):
	timer.start()

	body.queue_free()
	
	var instance
	instance = dead_scale.instantiate()
	get_tree().get_current_scene().add_child(instance)
	
	instance.transform = (global_transform)
	instance.apply_central_impulse(global_transform.basis.y * 10 )
	
func _on_timer_timeout():
	queue_free()

extends StaticBody3D
@onready var timer = $Timer
@onready var dead_scale = load("res://Scene/scaleDead.tscn")

#@onready var hit = $Hit
var lives = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var material = $ScaleMesh.mesh.surface_get_material(0)
	material.albedo_color = Color.CYAN
	


func _on_area_3d_body_entered(body):
	var material = $ScaleMesh.mesh.surface_get_material(0)
	#timer.start()
	body.queue_free()
	
	lives = lives +1
	
	var instance
	instance = dead_scale.instantiate()
	get_tree().get_current_scene().add_child(instance)
	
	instance.transform = (global_transform)
	instance.apply_central_impulse(global_transform.basis.y * 5 )
	if lives == 1:
		material.albedo_color = Color.YELLOW
	elif lives == 2:
		material.albedo_color = Color.ORANGE
	elif lives == 3:
		material.albedo_color = Color.RED
	elif lives == 4:
		queue_free()
#func _on_timer_timeout():
	#queue_free()

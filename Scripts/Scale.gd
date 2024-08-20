extends Node3D

signal you_win
@onready var timer = $Timer
@onready var dead_scale = load("res://Scene/scaleDead.tscn")
@onready var dead_scale_y = load("res://Scene/scaleDeadYellow.tscn")
@onready var dead_scale_o = load("res://Scene/scaleDeadOrange.tscn")
@onready var platinum = $ScaleMeshPlatinum
@onready var gold = $ScaleMeshGold
@onready var bronze = $ScaleMeshBronze

#@onready var hit = $Hit
var lives = 0
# Called when the node enters the scene tree for the first time.
#func _ready():
	#var material = $ScaleMesh.mesh.material_override
#

func _on_area_3d_body_entered(body):
	#var material = $ScaleMesh.mesh.surface_get_material(0)
	#timer.start()
	body.queue_free()
	$ScaleSound.play()
	lives = lives +1
	

	if lives == 1:
		platinum.visible = false
		var instance
		instance = dead_scale.instantiate()
		get_tree().get_current_scene().add_child(instance)
	
		instance.transform = (global_transform)
		instance.apply_central_impulse(global_transform.basis.y * 5 )
	elif lives == 2:
		gold.visible = false
		var instance2
		instance2 = dead_scale_y.instantiate()
		get_tree().get_current_scene().add_child(instance2)
	
		instance2.transform = (global_transform)
		instance2.apply_central_impulse(global_transform.basis.y * 5 )
	elif lives == 3:
		bronze.visible = false
		var instance3
		instance3 = dead_scale_o.instantiate()
		get_tree().get_current_scene().add_child(instance3)
	
		instance3.transform = (global_transform)
		instance3.apply_central_impulse(global_transform.basis.y * 5 )
	elif lives == 4:
		you_win.emit()
		queue_free()
#func _on_timer_timeout():
	#queue_free()

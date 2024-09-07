extends StaticBody3D


@onready var dragonExploding = preload("res://Scene/MAp/dragon_exploding.tscn")
signal you_win

#func _on_dragon_core_body_entered(body):
	#
	#$Dragon/AnimationPlayer.play("DeathDragon")
	#$DeathTimer.start()

func _on_death_timer_timeout():
	#instantiate exploding dragon
	var instance
	instance = dragonExploding.instantiate()
	get_tree().get_current_scene().add_child(instance)
	instance.transform = (global_transform)
	#get_tree().change_scene_to_file("res://Scene/Levels/WinScreen.tscn")
	you_win.emit()
	queue_free()
func _on_scale_you_win():
	win_sequence()

func win_sequence():
	$Dragon/AnimationPlayer.play("DeathDragon")
	$DeathTimer.start()

func _on_scale_1_you_win():
	win_sequence()


func _on_scale_2_you_win():
	win_sequence()


func _on_scale_3_you_win():
	win_sequence()


func _on_scale_4_you_win():
	win_sequence()


func _on_scale_5_you_win():
	win_sequence()


func _on_scale_6_you_win():
	win_sequence()


func _on_scale_7_you_win():
	win_sequence()


func _on_scale_8_you_win():
	win_sequence()


func _on_scale_9_you_win():
	win_sequence()


func _on_scale_10_you_win():
	win_sequence()


func _on_scale_11_you_win():
	win_sequence()


func _on_scale_12_you_win():
	win_sequence()


func _on_scale_13_you_win():
	win_sequence()


	
func _on_game_dragon_attack():
	$Dragon/AnimationPlayer.play("AttackDragon")
	$AttackTimer.start()
	$DragonSound.play()
func _on_attack_timer_timeout():
	$Dragon/AnimationPlayer.play("IdleDragon")

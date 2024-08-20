extends StaticBody3D



signal you_win

#func _on_dragon_core_body_entered(body):
	#
	#$Dragon/AnimationPlayer.play("DeathDragon")
	#$DeathTimer.start()

func _on_death_timer_timeout():
	#instantiate exploding dragon
	#queue_free()
	get_tree().change_scene_to_file("res://Scene/WinScreen.tscn")


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

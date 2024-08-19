extends Node3D


var VillagesDestroyed = 0

@onready var village_timer = $VillageTimer

func _ready():
	village_timer.start()

func _on_village_timer_timeout():
	if VillagesDestroyed == 0:
		village_timer.start()
		#destroy village 1 signal
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 1:
		village_timer.start()
		#destroy village 2 signal
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 2:
		village_timer.wait_time = 12
		village_timer.start()
		#destroy village 3 signal
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 3:
		village_timer.wait_time = 9
		village_timer.start()
		#destroy village 4 signal
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 4:
		village_timer.wait_time = 12
		village_timer.start()
		#destroy village 5 signal
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 5:
		village_timer.wait_time = 3
		village_timer.start()
		#destroy village 6 signal and lock weapon
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
	
	
	
	elif VillagesDestroyed == 6:
		get_tree().change_scene_to_file("res://Scene/LoseScreen.tscn")




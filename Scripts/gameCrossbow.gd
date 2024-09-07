extends Node3D


var VillagesDestroyed = 0

@onready var vfx1 = $Vfxs/Vfx1
@onready var vfx2 = $Vfxs/Vfx2
@onready var vfx3 = $Vfxs/Vfx3
@onready var vfx4 = $Vfxs/Vfx4
@onready var vfx5 = $Vfxs/Vfx5
@onready var vfx6 = $Vfxs/Vfx6
@onready var village_timer = $VillageTimer
signal dragonAttack 
func _ready():
	village_timer.start()

func _on_village_timer_timeout():
	if VillagesDestroyed == 0:
		village_timer.start()
		#destroy village 1 signal
		dragonAttack.emit()
		vfx1.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 1:
		village_timer.wait_time = 12
		village_timer.start()
		#destroy village 2 signal
		dragonAttack.emit()
		vfx2.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 2:
		village_timer.wait_time = 9
		village_timer.start()
		#destroy village 3 signal
		dragonAttack.emit()
		vfx3.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 3:
		village_timer.wait_time = 12
		village_timer.start()
		dragonAttack.emit()
		#destroy village 4 signal
		vfx4.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 4:
		village_timer.wait_time = 9
		village_timer.start()
		dragonAttack.emit()
		#destroy village 5 signal
		vfx5.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
		
	elif VillagesDestroyed == 5:
		village_timer.wait_time = 3
		village_timer.start()
		dragonAttack.emit()
		#destroy village 6 signal and lock weapon
		vfx6.process_mode = Node.PROCESS_MODE_INHERIT
		VillagesDestroyed = VillagesDestroyed+1
		print(VillagesDestroyed)
	
	
	
	elif VillagesDestroyed == 6:
		get_tree().change_scene_to_file("res://Scene/Levels/LoseScreen.tscn")
		
func _on_dragon_you_win():
	$Timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scene/Levels/WinScreen.tscn")

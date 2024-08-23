extends CharacterBody3D

@export_subgroup("Properties")
@export var movement_speed = 5

var canShoot = true
var arrow_strength = 30

var mouse_sensitivity = 700
var gamepad_sensitivity := 0.075

var mouse_captured := true

var movement_velocity: Vector3
var rotation_target: Vector3

var input_mouse: Vector2

var gravity := 0.0

var previously_floored := false

#var container_offset = Vector3(1.2, -1.1, -2.75)

var tween:Tween

signal health_updated
@export var projectile = load("res://Scene/Player/Projecticle.tscn")

@onready var camera = $Head/Camera
#@onready var sound_footsteps = $SoundFootsteps
@onready var blaster_cooldown = $Cooldown
#@export var crosshair:TextureRect

# Functions

func _ready():
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	
	# Handle functions
	
	handle_controls(delta)
	handle_gravity(delta)
	
	# Movement

	var applied_velocity: Vector3
	
	movement_velocity = transform.basis * movement_velocity # Move forward
	
	applied_velocity = velocity.lerp(movement_velocity, delta * 10)
	applied_velocity.y = -gravity
	
	velocity = applied_velocity
	move_and_slide()
	
	# Rotation
	
	camera.rotation.z = lerp_angle(camera.rotation.z, -input_mouse.x * 25 * delta, delta * 5)	
	
	camera.rotation.x = lerp_angle(camera.rotation.x, rotation_target.x, delta * 25)
	rotation.y = lerp_angle(rotation.y, rotation_target.y, delta * 25)

	# Movement sound
	#
	#sound_footsteps.stream_paused = true

	## Landing after jump or falling
	#
	camera.position.y = lerp(camera.position.y, 0.0, delta * 5)
	
	if is_on_floor() and gravity > 1 and !previously_floored: # Landed
		#Audio.play("sounds/land.ogg")
		camera.position.y = -0.1
	
	previously_floored = is_on_floor()

# Mouse movement

func _input(event):
	if event is InputEventMouseMotion and mouse_captured:
		
		input_mouse = event.relative / mouse_sensitivity
		
		rotation_target.y -= event.relative.x / mouse_sensitivity
		rotation_target.x -= event.relative.y / mouse_sensitivity

func handle_controls(_delta):
	
	# Mouse capture
	
	if Input.is_action_just_pressed("mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		mouse_captured = true
	
	if Input.is_action_just_pressed("mouse_capture_exit"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		mouse_captured = false
		
		input_mouse = Vector2.ZERO
	
	# Movement
	
	var input := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	movement_velocity = Vector3(input.x, 0, input.y).normalized() * movement_speed
	
	# Rotation
	
	var rotation_input := Input.get_vector("camera_right", "camera_left", "camera_down", "camera_up")
	
	rotation_target -= Vector3(-rotation_input.y, -rotation_input.x, 0).limit_length(1.0) * gamepad_sensitivity
	rotation_target.x = clamp(rotation_target.x, deg_to_rad(-90), deg_to_rad(90))
	
	# Shooting
	
	action_shoot()
	
# Handle gravity

func handle_gravity(delta):
	
	gravity += 20 * delta
	
	if gravity > 0 and is_on_floor():
		
		gravity = 0

# Shooting
#
func action_shoot():
	
	if Input.is_action_pressed("shoot"):
		if canShoot == true:
			#print("boom")
			crearProyectil()
			#$Fire.play()
			canShoot =false
			$Cooldown.start()
			
func _on_cooldown_timeout():
	canShoot = true

func crearProyectil():
	var instance
	instance = projectile.instantiate()
	get_tree().get_current_scene().add_child(instance)
	print("boom")
	
	#Movemos el proyectil al origen del disparo
	
	instance.transform = ($Head/Camera/Crossbow/Arrow2/Marker3D.global_transform)
	
	#Empujamos el proyectil con fuerza para adelante
	instance.apply_central_impulse($Head/Camera/Crossbow/Arrow2/Marker3D.global_transform.basis.z * arrow_strength * -1)


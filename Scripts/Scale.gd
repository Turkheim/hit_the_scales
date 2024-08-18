extends StaticBody3D
@onready var timer = $Timer

#@onready var hit = $Hit
var Dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  Dead == true:
		translate (Vector3.UP * delta * 20)

func _on_area_3d_body_entered(body):
	timer.start()
	Dead = true
	body.queue_free()
	
func _on_timer_timeout():
	queue_free()

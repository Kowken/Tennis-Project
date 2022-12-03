 extends KinematicBody

var velocity = Vector3(0,0,0)
const speed = 40

func _ready():
	pass


func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_right") and Input.is_action_just_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_just_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		
	if Input.is_action_just_pressed("ui_up") and Input.is_action_just_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_just_pressed("ui_up"):
		velocity.z = -speed
	elif Input.is_action_just_pressed("ui_down"):
		velocity.z = speed
	else:
		velocity.z = lerp(velocity.z,0,0.1)
	move_and_slide(velocity)
	
	


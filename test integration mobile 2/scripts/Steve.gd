extends KinematicBody

onready var joystick = get_parent().get_node("Joystick/TouchScreenButton")

const SPEED = 12
const ROTSPEED = 9

var velocity = Vector3(0,0,0)

func _ready():
	pass
	
func _physics_process(delta):
	
	#velocity = joystick.get_value()
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x=0
	elif Input.is_action_pressed("ui_right"):
		velocity.x= SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x= -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTSPEED))
	else:
		velocity.x= lerp(velocity.x,0,0.1) 
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z=0
	elif Input.is_action_pressed("ui_down"):
		velocity.z= SPEED
		$MeshInstance.rotate_x(deg2rad(ROTSPEED))
	elif Input.is_action_pressed("ui_up"):
		velocity.z= -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTSPEED))
	else:
		velocity.z= lerp(velocity.z,0,0.1)
	move_and_slide(velocity)

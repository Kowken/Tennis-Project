extends KinematicBody

var max_speed = 150
var gravity = 10
var acceleration = 0
var timer = null
var ms = 0
var s = 0
var m = 0

var _time_when_pushed_down = 0

var velocity = Vector3.ZERO

func _process(delta):
	if ms > 9 :
		s+=1
		ms=0
	if s >59 :
		m +=1
		s =0
	pass

func _physics_process(delta):
	var walk = Input.get_axis("left", "right")
	velocity.y -= gravity * delta
	velocity.x += gravity * delta * sin(walk)
	velocity.z += gravity * delta
	var collision = move_and_collide(velocity * delta)
	if collision !=null:
		_on_impact(collision.normal)
	if Input.is_action_just_pressed("shoot"):
		velocity.z -=velocity.z
func _on_impact(normal: Vector3):
	velocity = velocity.bounce(normal)
	velocity.x *= 0.5
	


func _on_Button_button_down():
	_time_when_pushed_down = OS.get_ticks_msec()

func _on_Button_button_up():
	var duration_pressed = (OS.get_ticks_msec() - _time_when_pushed_down) / 1000.0
	


func _on_Timer_timeout():
	ms+=1
	pass

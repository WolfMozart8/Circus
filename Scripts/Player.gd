extends CharacterBody3D

@export var speed: int = 10
@export var fall_acceleration: int = 10
@export var jump_impulse: int = 20

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse	
			
	target_velocity.x = direction.x * speed
	velocity = target_velocity
	move_and_slide()

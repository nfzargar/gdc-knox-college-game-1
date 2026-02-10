extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump (space / enter)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left / Right movement using arrow keys
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x = SPEED
	elif Input.is_key_pressed(KEY_LEFT):
		velocity.x = -SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

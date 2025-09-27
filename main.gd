# PlayerController.gd (attach to CharacterBody2D)

extends CharacterBody2D

# Movement speed (pixels per second)
@export var speed: float = 300.0

# Jump strength (pixels per second)
@export var jump_velocity: float = -400.0

# Gravity
@export var gravity: float = 900.0

func _physics_process(delta):
	var direction = 0.0
	
	# Left/right movement
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	
	velocity.x = direction * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Jump
		if Input.is_action_just_pressed("ui_accept"): # Default is spacebar or enter
			velocity.y = jump_velocity

	move_and_slide()

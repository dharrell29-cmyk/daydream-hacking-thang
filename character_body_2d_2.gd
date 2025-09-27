extends CharacterBody2D

var curSpeed = 0
const MAXSPEED = 600.0
const JUMP_VELOCITY = -1600.0

var lastDir = 0

var abc = [$"UntitledArtwork(2)",$"UntitledArtwork(2)2",$"UntitledArtwork(2)3"]

var this = 3
func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Jump cancel
	if Input.is_action_just_released("ui_accept"):
	#velocity.y = 0
		print("ya")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		#velocity.x = direction * SPEED
		curSpeed = move_toward(curSpeed, MAXSPEED, delta * (MAXSPEED * 5))
		velocity.x = direction * curSpeed
		print(direction)
		lastDir = direction
	else:
		curSpeed = move_toward(curSpeed, 0, delta * (MAXSPEED * 10))
		velocity.x = lastDir * curSpeed
		print(direction)

	move_and_slide()
	
	
func _process(delta: float) -> void:
	print($".".transform.origin)
	if $".".transform.origin.y >= 10000:
		$".".transform.origin.x = 50
		$".".transform.origin.y = 60

		if this == 3:
			$"UntitledArtwork(2)3".visible = false
			print(5555)
		if this == 2:
			$"UntitledArtwork(2)2".visible = false
		if this == 1:
			$"UntitledArtwork(2)".visible = false
		print("a")
	this -= 1
		
	

		

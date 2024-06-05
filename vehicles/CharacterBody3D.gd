extends CharacterBody3D

@export var camera : Camera3D
var head : Node3D

var move_speed : float = 5.0
var jump_force : float = 5.0
var gravity : float = 0.0

var look_sens : float = 0.5
var min_x_rot : float = -85.0
var max_x_rot : float = 0.0
var mouse_dir : Vector2

var left_flag : bool = false
var right_flag : bool = false
	
func _ready():
	# disable the mouse cursor
	# i've disabled this by default because it can be awkward to work around
	#Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	
	# get our nodes and detatch the camera
	#camera = get_node("Camera3D")
	head = get_node("Head")
	remove_child(camera)
	$"..".add_child.call_deferred(camera)

func _input(event):
	# when we move the mouse
	if event is InputEventMouseMotion:
		# look up and down
		camera.rotation_degrees.x += event.relative.y * -look_sens
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_x_rot, max_x_rot)
		
		# look left and right
		camera.rotation_degrees.y += event.relative.x * -look_sens
	
func _process(_delta):
	# have the camera follow our head position
	camera.position = head.global_position
	print(camera.position)
	
func _physics_process(_delta):
	# when we press SPACEBAR and we're on the ground, jump
	if Input.is_action_just_pressed("move_up"):# and is_on_floor():
		velocity.y = jump_force
	if Input.is_action_just_released("move_up"):
		velocity.y = 0
	if Input.is_action_just_pressed("move_down"):# and is_on_floor():
		velocity.y = -jump_force
	if Input.is_action_just_released("move_down"):
		velocity.y = 0
	
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	# convert that to a movement direction relative to our camera
	#var dir = camera.basis.z * input.y + camera.basis.x * input.x
	#var dir = head.basis.z * input.y + head.basis.x * input.x
	var dir = head.global_basis.z * input.y + head.basis.x * input.x
	dir.y = 0
	dir = dir.normalized()
	
	if Input.is_action_just_pressed("turn_left"):# and is_on_floor():
		left_flag = true
	if Input.is_action_just_released("turn_left"):
		left_flag = false
	if Input.is_action_just_pressed("turn_right"):# and is_on_floor():
		right_flag = true
	if Input.is_action_just_released("turn_right"):
		right_flag = false
	# get our movement inputs and calculate an input Vector2
	
	if right_flag:
		rotation.y -= jump_force * _delta
	if left_flag:
		rotation.y += jump_force * _delta
	# set our velocity
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed + rotation.y
	
	# apply the velocity and move the player
	move_and_slide() 
	
	
	
	
	

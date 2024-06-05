extends PathFollow3D

# Speed at which the object moves along the path
@export var set_speed: float = 0.1
var moving_forward: bool = true
var is_moving: bool = false

func _process(delta):
	var speed : float
	if is_moving:
		speed = set_speed
	else:
		speed = 0	
	if moving_forward:
		progress_ratio += speed * delta
	else:
		progress_ratio -= speed * delta

	# Loop the movement or handle end conditions
	if progress_ratio > 1:
		#progress_ratio = 0  # Reset to start for looping
		moving_forward =!moving_forward
		# or use `moving_forward = false` for back and forth movement
func start_moving():
	is_moving = true

func stop_moving():
	is_moving = false
	
func _input(event):
	if event is InputEventKey:
		if event.pressed and event.unicode == KEY_1:
			if is_moving:
				stop_moving()
			else:
				start_moving()

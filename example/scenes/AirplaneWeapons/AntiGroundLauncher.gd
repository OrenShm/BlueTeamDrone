extends Node3D

var MissileScene = preload("res://example/scenes/AirplaneWeapons/AirGroundMissile.tscn")
var fire_rate_seconds = 1.0  # Time between shots in seconds
var last_shot_time = 0.0
var missile_offset_from_aircraft = Vector3(0, -1, 0)

func fire_missile(target_position):
	print("Lunching new missile from aircraft")
	var airplaneNode = get_node_or_null("/root/Example/Aircraft")
	# TODO: Fetch it by father and not by get node!
	if (airplaneNode != null):
		var missile_instance = MissileScene.instantiate()
		missile_instance.position = airplaneNode.position + missile_offset_from_aircraft

		# TODO: add as child to father and not root
		#self.get_parent().add_child(missile_instance)
		var main_node = get_node_or_null("/root/Example/")
		main_node.add_child(missile_instance)
		missile_instance._shot_on_target(target_position)

func _can_fire(shot_destination: Vector3):
	# TODO: Limit not to shot at aircraft
	if (shot_destination.y > 0):
		print("Shot above ground not allowed, target point:", shot_destination)
		return false
	
	var timenow_sec = Time.get_ticks_msec() / 1000.0
	var time_diff = timenow_sec - last_shot_time
	var can_fire = time_diff >= fire_rate_seconds
	if (can_fire):
		last_shot_time = timenow_sec
	return can_fire

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var click_position = event.position
		var viewport := get_viewport()
		var mouse_position := viewport.get_mouse_position()
		var camera := viewport.get_camera_3d()
		
		var ray_origin = camera.project_ray_origin(click_position)
		var ray_direction = camera.project_ray_normal(click_position)
		
		# Perform a raycast from the ray origin in the direction of the ray
		var space_state = get_world_3d().direct_space_state
		var ray_length = 1000  # The length of the ray
		var ray_end = ray_origin + ray_direction * ray_length
		var result = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(ray_origin, ray_end))
			
		if result and _can_fire(result.position):
			fire_missile(result.position)

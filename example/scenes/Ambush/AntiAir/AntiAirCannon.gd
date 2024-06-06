extends Node3D

var aircraft_shoting_range: int = 300

var template_explosion = preload("res://example/scenes/Explosion/Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", Callable(self, "_on_launch_timer_elapsed"))
	$MeshInstance3D/RigidBody3D.connect("body_shape_entered", Callable(self, "_on_launcher_hit"))

func _aircraft_in_range():
	var aircraft = get_node_or_null("/root/Example/Aircraft")
	if (aircraft != null):
		return aircraft.position.distance_to(self.position) < aircraft_shoting_range

func _on_launch_timer_elapsed():
	if (_aircraft_in_range()):
		var missile_instance = preload("res://example/scenes/Ambush/AntiAir/AntiAirMissile.tscn").instantiate()
		missile_instance.position = self.position# + Vector3(0,0,10)
		print("Lunching new missile")
		self.get_parent().add_child(missile_instance)

func _on_launcher_hit():
	var new_explosion = template_explosion.instantiate()
	get_parent().add_child(new_explosion)
	new_explosion.global_transform.origin = self.global_transform.origin
	new_explosion.explode()
	self.queue_free()

func _on_area_3d_body_entered(body):
	_on_launcher_hit()

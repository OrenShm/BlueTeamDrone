extends Node3D

var aircraft_shoting_range: int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", Callable(self, "_on_launch_timer_elapsed"))

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


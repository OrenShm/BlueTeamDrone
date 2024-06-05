extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", Callable(self, "_on_launch_timer_elapsed"))

func _on_launch_timer_elapsed():
	var missile_instance = preload("res://example/scenes/Ambush/AntiAir/AntiAirMissile.tscn").instantiate()
	missile_instance.position = self.position# + Vector3(0,0,10)
	print("Lunching new missile")
	self.get_parent().add_child(missile_instance)


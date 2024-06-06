extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", Callable(self, "_check_ambushes"))
	pass # Replace with function body.

func _check_ambushes():
	var a = self.get_children()
	#print("launchers found: ", a.size())
	if (!is_instance_valid($AntiAirCannon1)&&
	!is_instance_valid($AntiAirCannon2)&&
	!is_instance_valid($AntiAirCannon3)&&
	!is_instance_valid($AntiAirCannon4)):
		print("YOU WON!")
		while(true):
			_add_song_to_parent()
			await get_tree().create_timer(2.0).timeout
		self.queue_free()

func _add_song_to_parent():
	$GameOverSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

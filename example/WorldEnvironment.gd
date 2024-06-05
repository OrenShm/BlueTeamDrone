extends WorldEnvironment

var cam : Camera3D
var camAttr : CameraAttributes

# Called when the node enters the scene tree for the first time.
func _ready():
	cam = get_node("CharacterBody3D/Camera3D")
	var x  = cam.get_property_list()
	for property in x:
		var property_name = property.name
		#var property_type = _get_type_name(property.type)
		print(property_name, ": ")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends MeshInstance3D

var max_health = 1000
var current_health = max_health
var damage = 250

func _ready():
	pass
	
func _process(delta):
	pass

func take_damage(damage_amount):
	current_health -= damage_amount
	if current_health <= 0:
		die()
	print(current_health)

func die():
	# Implement what happens when the object's health reaches 0
	print(self.name, " is dead")
	queue_free()  # This will remove the object from the scene


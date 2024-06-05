extends RigidBody3D

# Speed of the missile
var speed = 1

# Direction of the missile
var direction = Vector3()
#var template_explosion = preload("res://example/scenes/Explosion/Explosion.tscn")
#var new_explosion = template_explosion.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set initial direction (this can be modified based on your needs)
	direction = transform.basis.z.normalized()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move the missile forward
	translate(direction * speed * delta)
	#print(self.name, " is in ", self.global_position)
	

func _on_collision(body):
	# Handle what happens on collision (e.g., play an explosion, destroy the missile)
	#new_explosion.global_transform.origin = body.global_transform.origin
	#new_explosion.explode()
	queue_free()

func _on_RigidBody3D_body_entered(body):
	# Handle collision with another body
	if body.is_in_group("targets"):
		print(body.global_position)
		_on_collision(body)


func _on_body_entered(body):
	if body.is_in_group("targets"):
		print(body.global_position)
		_on_collision(body)

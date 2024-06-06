extends Node3D

var muzzle_velocity: float = 40
var gravity: Vector3 = Vector3(0, 0, 0)
#var gravity: Vector3 = Vector3(0, -9.8, 0)
var velocity: Vector3 = Vector3.ZERO
var template_explosion = preload("res://example/scenes/Explosion/Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if self.position.y <= 0:
		_missile_kill()

func _missile_kill():
	print("missile killed on ground")
	var new_explosion = template_explosion.instantiate()
	new_explosion.global_transform.origin = self.global_transform.origin
	get_parent().add_child(new_explosion)
	new_explosion.explode()
	queue_free()

func _shot_on_target(destination: Vector3) -> void:
	return _shoot_projectile(self.position, destination)

func _shoot_projectile(start_pos: Vector3, destination: Vector3) -> void:
	var direction = (destination - start_pos).normalized()
	#TODO: Avoid self colision
	self.look_at(destination, Vector3.UP, true)
	
	transform.origin = start_pos
	velocity = direction * muzzle_velocity

	# Interpolate along the trajectory (lerp from start to destination)
	var t = 0.01  # Adjust this value (0.0 to 1.0) for desired position
	transform.origin = lerp(start_pos, destination, t)

# NEVER REMOVE!!!
func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	transform.origin += velocity * delta

func _on_rigid_body_3d_body_entered(body):
	_missile_kill()

extends MeshInstance3D

var muzzle_velocity: float = 5
var gravity: Vector3 = Vector3(0, 0, 0)
#var gravity: Vector3 = Vector3(0, -9.8, 0)
var velocity: Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	var airplaneNode = get_node_or_null("/root/Example/Aircraft")
	if (airplaneNode != null):
		shoot_projectile(self.position, airplaneNode.position)


func shoot_projectile(start_pos: Vector3, destination: Vector3) -> void:
	var direction = (destination - start_pos).normalized()
	
	self.look_at(destination, Vector3.UP, false)
	
	transform.origin = start_pos
	velocity = direction * muzzle_velocity

	# Interpolate along the trajectory (lerp from start to destination)
	var t = 0.5  # Adjust this value (0.0 to 1.0) for desired position
	transform.origin = lerp(start_pos, destination, t)

# NEVER REMOVE!!!
func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	transform.origin += velocity * delta


# Example usage:
# Call shoot_projectile(start_position, destination_position) to simulate shooting.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

	
	#lerp()
		#
		#global_transform.origin = target_node.global_transform.origin
		#rotation.x = lerp_angle(rotation.x, target_node.rotation.x, delta*RotationSpeed)
		#rotation.y = lerp_angle(rotation.y, target_node.rotation.y, delta*RotationSpeed)
		#rotation.z = lerp_angle(rotation.z, target_node.rotation.z, delta*RotationSpeed)
	#pass

#
#export var muzzle_velocity: float = 25
#var gravity: Vector3 = Vector3(0, -9.8, 0)
#var velocity: Vector3 = Vector3.ZERO
#
#func _physics_process(delta: float) -> void:
	#velocity += gravity * delta
	#transform.origin += velocity * delta
#
#func shoot_projectile(start_pos: Vector3, destination: Vector3) -> void:
	#var direction = (destination - start_pos).normalized()
	#transform.origin = start_pos
	#velocity = direction * muzzle_velocity
#
	## Interpolate along the trajectory (lerp from start to destination)
	#var t = 0.5  # Adjust this value (0.0 to 1.0) for desired position
	#transform.origin = lerp(start_pos, destination, t)
#
## Example usage:
## Call shoot_projectile(start_position, destination_position) to simulate shooting.
## Adjust muzzle_velocity and gravity as needed.

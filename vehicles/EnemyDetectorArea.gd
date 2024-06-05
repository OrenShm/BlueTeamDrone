extends Area3D

#var missile_scene = preload("res://assets/weapons/pagaz.tscn")
#var tank_scene = preload("res://vehicles/tank.tscn")
#var convoy_scene = preload("res://vehicles/convoy.tscn")

#var timer : Timer 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#timer = $"../ReloadTimer"
	#timer.autostart = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if timer.time_left == 0:
		#timer.stop
##
##
#func _on_body_entered(body):
	#print("A body has entered enemy dete!", body.name, " on ", get_node(".").name, $"..".name)
	#
	#if timer.is_stopped():
		#timer.start($"..".time_to_reload)
		##timer.start($"..".time_to_reload)
		#var missile_instance = missile_scene.instantiate()
		#var tank_instance = tank_scene.instantiate()
		##tank_scene.get_node
		## Set the position and direction of the missile
		#missile_instance.global_transform.origin = tank_instance.find_child("TankNode3D").global_transform.origin
		#missile_instance.global_transform.basis.z = tank_instance.find_child("TankNode3D").global_transform.basis.z
		##missile_instance.global_transform.origin = tank_details.find_child("Node3D").global_transform.origin
		##missile_instance.global_transform.basis.z = tank_details.find_child("Node3D").global_transform.basis.z
		##print(missile_instance.global_transform.basis.z, missile_instance.global_transform.origin )
		## Add the missile to the scene
		#add_child(missile_instance)
		#missile_instance.find_child("PagazRigid")._on_RigidBody3D_body_entered(body)

extends Area3D

func _ready():
	pass#connect("body_entered", get_node("CollisionShape3D"), "_on_body_entered")

func _on_body_entered(body):
	print("A body has entered!", body.name, " on ", get_node(".").name, $"..".name)
	#emit_signal("body_entered_in_area", body)
	if body is RigidBody3D and body.is_in_group("targets"):
		var x = []
		x.append(10)
		self.get_parent().propagate_call("take_damage", x)
	if body is StaticBody3D:
		pass

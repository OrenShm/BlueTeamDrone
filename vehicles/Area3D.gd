extends Area3D

func _ready():
	pass#connect("body_entered", get_node("CollisionShape3D"), "_on_body_entered")

func _on_body_entered(body):
	print("A body has entered!", body.name, " on ", get_node(".").name, $"..".name)

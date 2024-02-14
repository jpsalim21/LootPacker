extends Node2D

@export var player : Player
var near : bool = false

@export var deliveredItem : ItemClass

func _process(_delta):
	if near and Input.is_action_just_pressed("interact"):
		player.changeItem(deliveredItem)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Entrou em uma estação")
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false

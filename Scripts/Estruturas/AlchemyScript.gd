extends Node2D

@export var player : Player
var near : bool = false

@export var itemEntregue : ItemClass

func _process(_delta):
	if near and Input.is_action_just_pressed("interact"):
		player.changeItem(itemEntregue)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Entrou na area de alquimia")
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false

#Resta configurar a classe que o changeItem chama

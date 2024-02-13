extends Node2D

@export var player : Player
var near : bool = false

@export var itemEntregue : ItemClass

func _process(delta):
	if near and Input.is_action_pressed("interact"):
		player.changeItem(itemEntregue)
		near = false #Coloquei isso para evitar erros de trocar o item para sempre


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Entrou na area de alquimia")
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false

#Resta configurar a classe que o changeItem chama

extends Node2D

@export var player : Player
var nearAlchemy:bool

func _process(delta):
	if nearAlchemy and Input.is_action_pressed("interact"):
		player.changeItem("healingPotion")
func _on_area_2d_body_entered(body):
	nearAlchemy = true
func _on_area_2d_body_exited(body):
	nearAlchemy = false

#Resta configurar a classe que o changeItem chama

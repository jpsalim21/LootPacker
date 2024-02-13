extends Node2D

@export var player : Player
var nearAlchemy:bool

var pocaoDeCura = "res://Items/healingPotion.tres"

func _process(delta):
	if nearAlchemy and Input.is_action_pressed("interact"):
		player.changeItem(pocaoDeCura.ItemClass)


func _on_area_2d_body_entered(body):
	nearAlchemy = true
	print("Alou")
func _on_area_2d_body_exited(body):
	nearAlchemy = false
	print("Tchaou")

#Resta configurar a classe que o changeItem chama

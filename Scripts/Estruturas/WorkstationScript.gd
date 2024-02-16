extends Node2D
class_name WorkStation

@export var player : Player
var near : bool = false
var rodando : bool = false
var jaComecou : bool = false

@export var itemEntregue : ItemClass
@export var itemReceita : ItemClass
@onready var minigame : Minigame = $Minigame

func _process(_delta):
	if near and Input.is_action_just_pressed("interact") and !rodando:
		if player.currentItem == itemReceita or jaComecou:
			rodando = true
			jaComecou = true
			minigame.comecarESair(true)
			player.changeItem(null)

func terminouMinigame():
	player.changeItem(itemEntregue)
	jaComecou = false

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false
		if rodando:
			minigame.comecarESair(false)
			rodando = false
		

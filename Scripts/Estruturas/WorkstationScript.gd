extends Node2D
class_name WorkStation

@export var player : Player
var near : bool = false
var rodando : bool = false

@export var itemEntregue : ItemClass
@export var minigame : Minigame

func _process(_delta):
	if near and Input.is_action_just_pressed("interact") and !rodando:
		rodando = true
		minigame.comecarESair(true)

func terminouMinigame():
	player.changeItem(itemEntregue)

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false
		if rodando:
			minigame.comecarESair(false)
			rodando = false
		

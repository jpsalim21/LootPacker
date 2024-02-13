extends Node2D

@export var player : Player
var nearChest:bool
var score = 0

func _ready():
	print("To pronto")

func _process(delta):
	if nearChest and Input.is_action_pressed("interact"):
		score += 10
		player.changeItem(null)
func _on_area_2d_body_entered(body):
	nearChest = true
func _on_area_2d_body_exited(body):
	nearChest = false

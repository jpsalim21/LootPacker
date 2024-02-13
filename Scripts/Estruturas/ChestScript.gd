extends Node2D

@export var player : Player
var nearChest : bool = false
var score = 0

func _ready():
	print("To pronto")

func _process(_delta):
	if nearChest and Input.is_action_just_pressed("interact"):
		player.changeItem(null)

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Entrou no bau")
		nearChest = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		print("Saiu do bau")
		nearChest = false

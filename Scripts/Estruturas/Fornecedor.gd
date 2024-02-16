extends Node2D

@export var itemEntregar : ItemClass
@export var player : Player

@onready var sprite : Sprite2D = $CutRuby

var near : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = itemEntregar.sprite
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if near and Input.is_action_just_pressed("interact"):
		player.changeItem(itemEntregar)
	pass


func _on_area_2d_body_entered(body):
	near = true
	pass # Replace with function body.
func _on_area_2d_body_exited(body):
	near = false
	pass # Replace with function body.

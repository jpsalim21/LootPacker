extends Node2D

@export var itemEntregar : ItemClass
@export var player : Player

@onready var sprite : Sprite2D = $CutRuby
@onready var spriteLight : Sprite2D = $CutRuby2
@onready var colisor = $StaticBody2D

var near : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player.aproximou.connect(enter)
	sprite.texture = itemEntregar.sprite
	spriteLight.texture = itemEntregar.sprite
	spriteLight.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if near and Input.is_action_just_pressed("interact"):
		player.changeItem(itemEntregar)
	pass

func enter(new, old):
	if new == colisor:
		near = true
		spriteLight.visible = true
		return
	if old == colisor:
		near = false
		spriteLight.visible = false
		return

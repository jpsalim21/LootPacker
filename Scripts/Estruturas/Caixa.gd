extends Node2D

var item : ItemClass
@export var player : Player

@onready var highlight = $Quadrado
@onready var spriteItem = $IronSword
@onready var colisor = $StaticBody2D

var estaAtivo = false

func _ready():
	player.aproximou.connect(ativo)
	pass

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if estaAtivo and Input.is_action_just_pressed("interact"):
		trocarItem()

func ativo(new, old):
	if new == colisor:
		estaAtivo = true
		highlight.visible = true
	if old == colisor:
		estaAtivo = false
		highlight.visible = false
	
func trocarItem():
	var itemNovo = player.changeItem(item)
	item = itemNovo
	if item == null:
		spriteItem.texture = null
	else:
		spriteItem.texture = item.sprite

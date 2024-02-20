extends Node2D
class_name WorkStation

@export var player : Player
var near : bool = false
var rodando : bool = false
var jaComecou : bool = false

@export var itemEntregue : ItemClass
@export var itemReceita : ItemClass
@onready var minigame : Minigame = $Minigame

@onready var spriteLight = $Icon2
@onready var colisor = $StaticBody2D

func _ready():
	player.aproximou.connect(enter)

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

func enter(new, old):
	if new == colisor:
		near = true
		spriteLight.visible = true
		return
	if old == colisor:
		near = false
		spriteLight.visible = false
		if rodando:
			minigame.comecarESair(false)
			rodando = false
		return

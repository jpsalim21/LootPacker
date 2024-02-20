extends Node2D

@export var player : Player
var nearChest : bool = false
var score = 0
@export var aventureirosController : AventureirosController

@onready var spriteLight = $Chest2
@onready var colisor = $StaticBody2D

func _ready():
	player.aproximou.connect(enter)

func _process(_delta):
	if nearChest and Input.is_action_just_pressed("interact"):
		RecebeItem()

func RecebeItem():
	var itemNovo = player.changeItem(null)
	aventureirosController.AplicaItem(itemNovo)

func enter(new, old):
	if new == colisor:
		nearChest = true
		spriteLight.visible = true
		return
	if old == colisor:
		nearChest = false
		spriteLight.visible = false
		return

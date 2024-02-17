extends Node
class_name lifeBarScript

const Enums = preload("res://Scripts/Aventureiros/Enum.gd")

@export var aventureiro : Aventureiro

var comecar : bool = false

@onready var barra : ProgressBar = $ProgressBar
@onready var barraInteresse : ProgressBar = $ProgressBar2
@onready var spriteTipo : TextureRect = $Tipo
@onready var spriteEmote : TextureRect = $PerfilPersonagem

func setup():
	self.visible = true
	print("Rodou setup")
	comecar = true
	spriteTipo.texture = aventureiro.sprite
	aventureiro.vida = aventureiro.vidaMax
	aventureiro.interesse = aventureiro.interesseMax
	barra.max_value = aventureiro.vidaMax
	barraInteresse.max_value = aventureiro.interesseMax

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !comecar:
		return
	aventureiro.diminuir(delta)
	barra.value = aventureiro.vida
	barraInteresse.value = aventureiro.interesse
	pass

func aplicaItem(item):
	if aventureiro.aplicaItem(item):
		spriteEmote.texture = preload("res://Sprites/UI/Quadrado1.png")
	else:
		spriteEmote.texture = preload("res://Sprites/UI/Quadrado3.png")

extends Node

var near : bool = false
@export var ingrediente : ItemClass
@export var itemResultante : ItemClass
@export var player : Player

@onready var timerEspera : Timer = $Timer
@onready var alarme = $Alarme

@onready var barraProgresso : ProgressBar = $ProgressBar
@export var tempoMax : float
var tempo : float = 0
var cozinhando : bool = false
var pronto : bool = false

@onready var colisor = $StaticBody2D
@onready var spriteLight = $Cenario3

# Called when the node enters the scene tree for the first time.
func _ready():
	player.aproximou.connect(enter)
	barraProgresso.visible = false
	barraProgresso.value = tempo
	barraProgresso.max_value = tempoMax
	spriteLight.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if near and Input.is_action_just_pressed("interact"):
		if pronto:
			player.changeItem(itemResultante)
			timerEspera.stop()
			alarme.visible = false
			pronto = false
			tempo = 0
			barraProgresso.value = tempo
			cozinhando = false
		elif player.currentItem == ingrediente:
			barraProgresso.visible = true
			player.changeItem(null)
			cozinhando = true
	if cozinhando:
		if tempo < tempoMax:
			tempo += delta
			barraProgresso.value = tempo
		elif !pronto:
			barraProgresso.visible = false
			pronto = true
			timerEspera.wait_time = 3
			timerEspera.start()
	pass

func enter(new, old):
	print("Chamou no " + self.name)
	if new == colisor:
		near = true
		spriteLight.visible = true
		return
	if old == colisor:
		near = false
		spriteLight.visible = false
		return

func _on_timer_timeout():
	alarme.visible = not alarme.visible
	if alarme.visible:
		print("Timer começou")
		timerEspera.wait_time = 6
		timerEspera.start()
	else:
		timerEspera.stop()
		pronto = false
		tempo = 0
		barraProgresso.value = tempo
		cozinhando = false
		barraProgresso.visible = false

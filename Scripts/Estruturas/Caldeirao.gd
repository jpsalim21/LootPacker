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

# Called when the node enters the scene tree for the first time.
func _ready():
	barraProgresso.visible = false
	barraProgresso.value = tempo
	barraProgresso.max_value = tempoMax
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
			timerEspera.start()
	pass
	
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		near = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		near = false


func _on_timer_timeout():
	alarme.visible = not alarme.visible
	if alarme.visible:
		print("Timer começou")
		timerEspera.start()
	else:
		timerEspera.stop()
		pronto = false
		tempo = 0
		barraProgresso.value = tempo
		cozinhando = false
		barraProgresso.visible = false

class_name Minigame
extends Node

@onready var objetoVerde = $minigameBarra/Verde
@onready var animador : AnimationPlayer = $AnimationPlayer
@onready var animadorAcerto : AnimationPlayer = $AnimationPlayer2
@onready var barraProgresso : ProgressBar = $ProgressBar
@onready var nodeMinigame : Node2D = $minigameBarra
@onready var audio : AudioStreamPlayer = $AudioStreamPlayer

var audioClips = load("res://Sounds/Retro4.wav")
var pitchShift : float = 1

@export var workStation : WorkStation

var near : bool = false
var pontuacao : int = 0

var xMax = 23
var xMin = -19

var animationSpeed : float = 1.0

@export var progressoMax : float = 50
var progressoAtual : float = 0

var ocorrendo : bool = false


func _ready():
	nodeMinigame.visible = false
	barraProgresso.visible = false
	barraProgresso.max_value = progressoMax
	barraProgresso.value = 0
	pass # Replace with function body.

func _process(_delta):
	if not ocorrendo:
		return #Se o player estiver longe, a barra não progride
	if Input.is_action_just_pressed("minigame"):
		if near:
			acertou(1)
		else:
			acertou(-1)
	if(progressoAtual < progressoMax):
		progressoAtual += _delta
		barraProgresso.value = progressoAtual
	else:
		barraProgresso.value = 0
		progressoAtual = 0
		animationSpeed = 1
		animador.speed_scale = animationSpeed
		ocorrendo = false
		workStation.terminouMinigame()
		pitchShift = 1
		comecarESair(false)

func acertou(i : int):
	pontuacao += i
	var novoX = randi_range(xMin, xMax)
	objetoVerde.position.x = novoX
	
	if i > 0:
		audio.pitch_scale = pitchShift
		animadorAcerto.play("acerto")
		audio.stream = audioClips
		audio.play()
		pitchShift = min(pitchShift + 0.1, 2)
		progressoAtual += 5
		barraProgresso.value = progressoAtual
		animationSpeed = min(animationSpeed + 0.2, 2.2)
		animador.speed_scale = animationSpeed
	else:
		pitchShift = 1
		audio.pitch_scale = pitchShift
		progressoAtual -= 3
		barraProgresso.value = progressoAtual
		animationSpeed = 1
		animador.speed_scale = animationSpeed
		
func comecarESair(boleana : bool):
	ocorrendo = boleana
	nodeMinigame.visible = boleana
	barraProgresso.visible = progressoAtual > 0 or boleana

#Verificam se a parte verde toca na azul
func _on_area_2d_area_entered(area):
	if area.name == "AzulArea":
		near = true
	pass # Replace with function body.
func _on_area_2d_area_exited(area):
	if area.name == "AzulArea":
		near = false
	pass # Replace with function body.

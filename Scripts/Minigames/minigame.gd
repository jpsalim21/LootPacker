extends Node

@onready var objetoVerde = $Verde
@onready var animador : AnimationPlayer = $AnimationPlayer
@onready var barraProgresso : ProgressBar = $ProgressBar

var near : bool = false
var pontuacao : int = 0

var xMax = 23
var xMin = -19

var animationSpeed : float = 1.0

@export var progressoMax : float = 50
var progressoAtual : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	barraProgresso.max_value = progressoMax
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("minigame"):
		if near:
			acertou(1)
		else:
			acertou(-1)
	progressoAtual += _delta
	barraProgresso.value = progressoAtual
	pass

func acertou(i : int):
	pontuacao += i
	var novoX = randi_range(xMin, xMax)
	objetoVerde.position.x = novoX
	
	if i > 0:
		progressoAtual += 5
		barraProgresso.value = progressoAtual
		animationSpeed = min(animationSpeed + 0.2, 2.2)
		animador.speed_scale = animationSpeed
	else:
		progressoAtual -= 3
		barraProgresso.value = progressoAtual
		animationSpeed = 1
		animador.speed_scale = animationSpeed

func _on_area_2d_area_entered(_area):
	near = true
	pass # Replace with function body.
	
func _on_area_2d_area_exited(_area):
	near = false
	pass # Replace with function body.

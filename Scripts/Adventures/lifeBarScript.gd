extends Node

@export var maxVida : float
@export var maxInteresse: float
var vidaAtual : float 
var interesseAtual : float

@onready var barra : ProgressBar = $ProgressBar
@onready var barraInteresse : ProgressBar = $ProgressBar2

# Called when the node enters the scene tree for the first time.
func _ready():
	vidaAtual = maxVida
	interesseAtual = maxInteresse
	barra.max_value = maxVida
	barraInteresse.max_value = maxInteresse
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vidaAtual -= delta
	interesseAtual -= delta
	barra.value = vidaAtual
	barraInteresse.value = interesseAtual
	pass

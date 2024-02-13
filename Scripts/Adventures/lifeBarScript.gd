extends Node

@export var max : float
var atual : float 
var porcentagem : float

@onready var barra : ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	atual = max
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	atual -= delta
	porcentagem = atual / max
	barra.value = porcentagem
	pass

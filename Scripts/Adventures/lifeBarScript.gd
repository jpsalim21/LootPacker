extends Node

@export var max : float
var atual : float 

@onready var barra : ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	atual = max
	barra.max_value = max
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	atual -= delta
	barra.value = atual
	pass

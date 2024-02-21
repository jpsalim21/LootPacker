extends CanvasLayer
class_name AventureirosController

@onready var aventureiros : Array[lifeBarScript] = [
	$AventureirosController/LifeBar,
	$AventureirosController/LifeBar2,
	$AventureirosController/LifeBar3
]
var aventureirosProntos : Array[lifeBarScript] = []
var index = 0

@onready var timer = $Timer

var Enums = preload("res://Scripts/Aventureiros/Enum.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	aventureiros[index].setup()
	aventureirosProntos.append(aventureiros[index])
	index += 1
	timer.start()
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		#AplicaItem()
		pass

func AplicaItem(item : ItemClass):
	if aventureirosProntos.is_empty():
		return
	
	var aventureiroAtual : lifeBarScript = aventureirosProntos[0]
	var lastPosition = aventureirosProntos[aventureirosProntos.size() - 1].position
	
	for i in range(aventureirosProntos.size() - 1, 0, -1):
		aventureirosProntos[i].position = aventureirosProntos[i-1].position
	
	aventureirosProntos[0].position = lastPosition
	
	aventureirosProntos.erase(aventureiroAtual)
	aventureirosProntos.append(aventureiroAtual)
	aventureiroAtual.aplicaItem(item)

func _on_timer_timeout():
	aventureiros[index].setup()
	aventureirosProntos.append(aventureiros[index])
	index += 1
	if index >= 3:
		timer.stop()
	pass # Replace with function body.

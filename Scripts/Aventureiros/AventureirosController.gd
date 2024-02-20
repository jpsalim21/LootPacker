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
	pass

func AplicaItem(item : ItemClass):
	if aventureirosProntos.is_empty():
		return
	var aventureiroAtual : lifeBarScript = aventureirosProntos[0]
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

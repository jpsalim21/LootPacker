extends Area2D

var listaObjetos : Array[Node2D]
var oldObject = null

@onready var player : Player = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	calculaMenor()
	pass

func _on_body_entered(body):
	listaObjetos.append(body)
	print("Adicionei")
func _on_body_exited(body):
	listaObjetos.erase(body)
	print("Removi")
	
func calculaMenor():
	if listaObjetos.is_empty(): return
	var _objetoEscolhido = null
	var menorDist = 3000
	for item : Node2D in listaObjetos:
		var dist = self.position.distance_to(item.position)
		print(dist)
		if dist < menorDist: 
			menorDist = dist
			_objetoEscolhido = item
	if _objetoEscolhido == oldObject: return
	player.aproximou.emit(_objetoEscolhido, oldObject)
	oldObject = _objetoEscolhido
	

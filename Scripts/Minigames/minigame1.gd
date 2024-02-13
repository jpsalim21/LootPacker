extends Node

var near : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("minigame") && near:
		print("Acertou")
	pass



func _on_area_2d_area_entered(area):
	near = true
	pass # Replace with function body.
	
func _on_area_2d_area_exited(area):
	near = false
	pass # Replace with function body.

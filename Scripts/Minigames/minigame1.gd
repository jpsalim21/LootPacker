extends Node

var near : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_area_2d_area_entered(_area):
	near = true
	pass # Replace with function body.
	
func _on_area_2d_area_exited(_area):
	near = false
	pass # Replace with function body.

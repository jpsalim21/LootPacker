extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction2 = Input.get_axis("ui_up", "ui_down")
	
	var directionVector = Vector2(direction, direction2)
	velocity = directionVector.normalized() * SPEED
	move_and_slide()

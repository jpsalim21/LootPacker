extends CharacterBody2D

const SPEED = 100.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction2 = Input.get_axis("ui_up", "ui_down")
	
	directionVector = Vector2(direction, direction2)
	velocity = directionVector.normalized() * SPEED
	update_animation()
	move_and_slide()

func update_animation():
	if velocity.y < 0 and velocity.x == 0:
		animation = "Up"
	elif velocity.y > 0 and velocity.x == 0:
		animation = "Down"
	elif velocity.x < 0:
		animation = "Side"
		animatedSprite.flip_h = true
	elif velocity.x > 0:
		animation = "Side"
		animatedSprite.flip_h = false
	else:
		animation = "Idle"
	animatedSprite.play(animation)

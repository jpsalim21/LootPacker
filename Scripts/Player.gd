extends CharacterBody2D
class_name Player

var SPEED = 60.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var itemSprite : Sprite2D = $ItemSprite
var currentItem : ItemClass

func _process(_delta):
	if Input.is_action_just_pressed("run"):
		SPEED += 40
	elif Input.is_action_just_released("run") and SPEED == 100.0:
		SPEED -= 40
	update_animation()

func _physics_process(_delta):
	directionVector = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = directionVector.normalized() * SPEED
	move_and_slide()
	

func update_animation():
	if velocity.y < 0:
		animation = "Up"
		if velocity.x != 0:
			animation = "DiagonalUp"
			if velocity.x > 0:
				animatedSprite.flip_h = false
			else:
				animatedSprite.flip_h = true
	elif velocity.y > 0:
		animation = "Down"
		if velocity.x != 0:
			animation = "DiagonalDown"
			if velocity.x > 0:
				animatedSprite.flip_h = false
			else:
				animatedSprite.flip_h = true
	elif velocity.x != 0:
		animation = "Side"
		if velocity.x > 0:
			animatedSprite.flip_h = false
		elif velocity.x < 0:
			animatedSprite.flip_h = true
	else:
		animation = "IdleDown"
	animatedSprite.play(animation)

func changeItem(newItem: ItemClass):
	currentItem = newItem
	if(currentItem == null):
		print("Trocou para nulo")
		itemSprite.visible = false
		itemSprite.texture = null
	else:
		print("Novo item: " + newItem.nome)
		itemSprite.visible = true
		itemSprite.texture = currentItem.sprite

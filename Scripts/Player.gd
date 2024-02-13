extends CharacterBody2D
class_name Player

const SPEED = 60.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var itemSprite : Sprite2D = $ItemSprite
var currentItem : ItemClass

func _ready():

	pass

func _process(delta):
	update_animation()

func _physics_process(delta):
	directionVector = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = directionVector.normalized() * SPEED
	move_and_slide()

func update_animation():
	if velocity.y < 0:
		animation = "Up"
		if velocity.x != 0:
			animation = "DiagonalUp"
	elif velocity.y > 0:
		animation = "Down"
		if velocity.x > 0:
			animation = "DiagonalDown"
			animatedSprite.flip_h = false
		elif velocity.x < 0:
			animation = "DiagonalDown"
			animatedSprite.flip_h = true
	elif velocity.x < 0:
		animation = "Side"
		animatedSprite.flip_h = true
	elif velocity.x > 0:
		animation = "Side"
		animatedSprite.flip_h = false
	else:
		animation = "Idle"
	animatedSprite.play(animation)

func changeItem(newItem):
	currentItem = newItem
	if(currentItem == null):
		itemSprite.visible = false
		itemSprite.texture = null
	else:
		currentItem.nome = newItem.nome
		currentItem.sprite = newItem.sprite
		currentItem.itemIndex = newItem.itemIndex

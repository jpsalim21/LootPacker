extends CharacterBody2D
class_name Player

var SPEED = 100.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var itemSprite : Sprite2D = $ItemSprite
@export var currentItem : ItemClass

signal aproximou(novo, velho)

@export var objeto : Node2D

func _process(_delta):
	print(self.position.distance_to(objeto.position))
	update_animation()

func _physics_process(_delta):
	directionVector = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = directionVector.normalized() * SPEED
	move_and_slide()
	

func update_animation():
	if directionVector.y < -0.5:
		animation = "Up"
		if directionVector.x > 0.5 or directionVector.x < -0.5:
			animation = "DiagonalUp"
			if directionVector.x > 0:
				animatedSprite.flip_h = false
			else:
				animatedSprite.flip_h = true
	elif directionVector.y > 0.5:
		animation = "Down"
		if directionVector.x > 0.5 or directionVector.x < -0.5:
			animation = "DiagonalDown"
			if directionVector.x > 0:
				animatedSprite.flip_h = false
			else:
				animatedSprite.flip_h = true
	elif directionVector.x != 0:
		animation = "Side"
		if directionVector.x > 0:
			animatedSprite.flip_h = false
		elif directionVector.x < 0:
			animatedSprite.flip_h = true
	else:
		animation = "IdleDown"
	animatedSprite.play(animation)

func changeItem(newItem: ItemClass):
	var retorno = currentItem
	currentItem = newItem
	if(currentItem == null):
		print("Trocou para nulo")
		itemSprite.visible = false
		itemSprite.texture = null
	else:
		print("Novo item: " + newItem.nome)
		itemSprite.visible = true
		itemSprite.texture = currentItem.sprite
	return retorno

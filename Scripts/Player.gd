extends CharacterBody2D

const SPEED = 100.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var itemSprite : Sprite2D = $ItemSprite
var itemAtual : ItemClass

func _ready():
	itemAtual = ItemClass.new()
	itemAtual.nome = "shield"
	itemAtual.sprite = itemSprite.texture
	itemAtual.itemIndex = 0
	pass

func _process(delta):
	update_animation()

func _physics_process(delta):
	directionVector = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = directionVector.normalized() * SPEED
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

func trocaItem(novoItem):
	itemAtual = novoItem
	if(itemAtual == null):
		itemSprite.visible = false
		itemSprite.texture = null
	else:
		print(itemAtual.nome)
	pass

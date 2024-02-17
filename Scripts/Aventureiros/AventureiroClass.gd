extends Resource
class_name Aventureiro

const Enums = preload("res://Scripts/Aventureiros/Enum.gd")

@export var sprite : Texture2D
@export var classeAtual : Enums.classe

@export var vidaMax : float
var vida : float
@export var interesseMax : float
var interesse : float

func diminuir(valor):
	vida -= valor
	interesse -= valor
	if vida < 0:
		vida = 0
	if interesse < 0:
		interesse = 0

func aplicaItem(item : ItemClass):
	if item.classeAfetada != classeAtual and item.classeAfetada != Enums.classe.Todas:
		print("Deu item errado")
		interesse = max(interesse - 10, 0)
		return false #Item errado
	vida += item.vida
	interesse += item.interesse
	if vida > vidaMax:
		vida = vidaMax
	if vida < 0:
		vida = 0
	if interesse > interesseMax:
		interesse = interesseMax
	if interesse < 0:
		interesse = 0
	return true

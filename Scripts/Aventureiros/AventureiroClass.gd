extends Resource
class_name Aventureiro

enum classe{
	Guerreiro,
	Mago,
	Ranger
}

@export var sprite : Texture2D
@export var classeAtual : classe

@export var vidaMax : float
var vida : float
@export var interesseMax : float
var interesse : float

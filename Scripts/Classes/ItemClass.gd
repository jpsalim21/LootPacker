extends Resource

class_name ItemClass

const Enums = preload("res://Scripts/Aventureiros/Enum.gd")

@export var sprite : CompressedTexture2D
@export var itemIndex : int
@export var nome : String

@export var vida : float
@export var interesse : float

@export var classeAfetada : Enums.classe
@export var nEfeito : float

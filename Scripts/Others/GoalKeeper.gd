extends Node2D

@export_range(0,5) var playerSkin : int = 0
@onready var _animation_player = $AnimationPlayer
@onready var _skin = $Skin
const _skins = preload("res://Scripts/GoalKeeperSkin.gd")

func _ready():
	_skin.texture = _skins.textures[playerSkin]

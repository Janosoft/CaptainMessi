extends Node2D

@export_range(0,11) var playerSkin : int = 0
@onready var _animation_player = $AnimationPlayer
@onready var _skin = $Skin
const _skins = preload("res://Scripts/PlayerSkin.gd")

func _ready():
	_skin.texture = _skins.textures[playerSkin]

func shoot(direction : String):
	if direction == 'Left':
		_animation_player.play("shootLeft")
	else:
		_animation_player.play("shootRight")

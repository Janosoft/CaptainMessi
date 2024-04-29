@icon("../module.svg")
extends CharacterBody2D
class_name Player

@export var playerName : String
@export var playerNumber : int
@export var playerPosition : int
@export var skinColor: Color = Color(0.996078, 0.8, 0.772549, 1)
@export var hairColor: Color = Color(0.509804, 0.384314, 0.301961, 1)

@export var gutsCount : int = 600
@export var dribbleCount : int = 8
@export var passCount : int = 8
@export var shotCount : int = 8

@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func showPlayer(animation : String):
	setAnimation(animation)
	visible = true

func hidePlayer():
	visible = false
	_animated_sprite_2d.stop()

func setAnimation(animation:String):
	_animated_sprite_2d.stop()
	if _animated_sprite_2d.sprite_frames.has_animation(animation):
		_animated_sprite_2d.play(animation)
	else:
		print_debug("animation NOT EXISTS: " + animation)

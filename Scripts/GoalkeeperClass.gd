@icon("../module.svg")
extends CharacterBody2D
class_name Goalkeeper

@export var playerName : String
@export var playerNumber : int
@export var skinColor: Color = Color(0.996078, 0.8, 0.772549, 1)
@export var hairColor: Color = Color(0.509804, 0.384314, 0.301961, 1)

@export var gutsCount : int = 600
@export var punchCount : int = 8
@export var catchCount : int = 8

@onready var animated_sprite_2d = $AnimatedSprite2D

func setAnimation(animation:String):
	animated_sprite_2d.play(animation)

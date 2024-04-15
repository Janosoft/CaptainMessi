extends CharacterBody2D

@export var playerName: String = ''
@export var skinColor: Color = Color(0.996078, 0.8, 0.772549, 1)
@export var hairColor: Color = Color(0.509804, 0.384314, 0.301961, 1)
@onready var animated_sprite_2d = $AnimatedSprite2D

func setAnimation(animation:String):
	animated_sprite_2d.play(animation)

extends Node2D

@onready var _animation_player = $AnimationPlayer

func penaltyKickStand():
	_animation_player.play("PK Stand")

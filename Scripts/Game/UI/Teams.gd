extends Sprite2D

@onready var _animation_player = $AnimationPlayer

func showTeams():
	_animation_player.stop()
	_animation_player.play("show")

func hideTeams():
	_animation_player.stop()
	_animation_player.play("hide")

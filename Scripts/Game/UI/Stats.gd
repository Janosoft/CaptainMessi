extends Sprite2D

@onready var _animation_player = $AnimationPlayer

func showStats():
	_animation_player.stop()
	_animation_player.play("show")

func hideStats():
	_animation_player.stop()
	_animation_player.play("hide")

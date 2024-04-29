extends Sprite2D

@onready var _animation_player = $AnimationPlayer

func showTime():
	_animation_player.stop()
	_animation_player.play("show")

func hideTime():
	_animation_player.stop()
	_animation_player.play("hide")

extends AnimatedSprite2D

@onready var _animation_player = $AnimationPlayer

func showSmallBalloon():
	_animation_player.stop()
	_animation_player.play("small")
	_animation_player.queue("show")

func showSmallScreamBalloon():
	_animation_player.stop()
	_animation_player.play("smallScream")
	_animation_player.queue("show")

func showMediumBalloon():
	_animation_player.stop()
	_animation_player.play("medium")
	_animation_player.queue("show")

func showBigBalloon():
	_animation_player.stop()
	_animation_player.play("big")
	_animation_player.queue("show")

func hideBalloon():
	_animation_player.stop()
	_animation_player.play("hide")

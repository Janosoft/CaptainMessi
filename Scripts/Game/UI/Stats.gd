extends Sprite2D

@onready var _animation_player = $AnimationPlayer
@onready var _name = $Name

func setName(playerName : String):
	_name.text = playerName

func showSmallStats():
	_animation_player.stop()
	_animation_player.play("small")
	_animation_player.queue("show")

func showBigStats():
	_animation_player.stop()
	_animation_player.play("big")
	_animation_player.queue("show")

func hideStats():
	_animation_player.stop()
	_animation_player.play("hide")

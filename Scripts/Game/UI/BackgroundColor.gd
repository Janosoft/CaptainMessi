extends ColorRect
@onready var _animation_player = $AnimationPlayer

func danger():
	_animation_player.stop()
	_animation_player.play("danger")

func default():
	_animation_player.stop()
	_animation_player.play("default")

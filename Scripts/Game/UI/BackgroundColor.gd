extends ColorRect
@onready var animation_player = $AnimationPlayer

func danger():
	_animation_player.stop()
	animation_player.play("danger")

func default():
	_animation_player.stop()
	animation_player.play("default")

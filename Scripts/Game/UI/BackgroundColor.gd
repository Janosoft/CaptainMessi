extends ColorRect
@onready var animation_player = $AnimationPlayer

func danger():
	animation_player.play("danger")

func default():
	animation_player.play("default")

extends Sprite2D

@onready var _animation_player = $AnimationPlayer
@onready var _title = $Title
@onready var _clock = $Clock

func setTitle(newTitle : String):
	_title.text= newTitle

func setClock(clockTime : String):
	_clock.text= clockTime

func showTime():
	_animation_player.stop()
	_animation_player.play("show")

func hideTime():
	_animation_player.stop()
	_animation_player.play("hide")

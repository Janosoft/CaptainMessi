@icon("../module.svg")
extends Sprite2D
class_name UI_Actions

@onready var _label = $Label
@onready var _activity = $Activity
@onready var _animation_player = $AnimationPlayer

func showActions():
	_animation_player.stop()
	_animation_player.play("show")

func hideActions():
	_animation_player.stop()
	_animation_player.play("hide")

func setLabel(newLabel : String):
	_label.text = newLabel

func setActivity(newActivity : String):
	_activity.text = newActivity

@icon("../module.svg")
extends Sprite2D
class_name UI_Actions

@onready var _label = $Label
@onready var _activity = $Activity

func setLabel(newLabel : String):
	_label.text = newLabel

func setActivity(newActivity : String):
	_activity.text = newActivity

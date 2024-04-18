@icon("../module.svg")
extends Sprite2D
class_name UI_Actions

@onready var label = $Label
@onready var activity = $Activity

func setLabel(newLabel : String):
	label.text = newLabel

func setActivity(newActivity : String):
	activity.text = newActivity

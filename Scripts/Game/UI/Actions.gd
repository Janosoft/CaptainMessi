extends Sprite2D

@onready var label = $Label
@onready var activity = $Activity

func setLabel(newLabel : String):
	label.text = newLabel

func setActivity(newActivity : String):
	activity.text = newActivity

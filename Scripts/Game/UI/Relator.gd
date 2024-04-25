extends AnimatedSprite2D
@onready var _animation_player = $AnimationPlayer
var _status : String = "default"

#region Emotions
func default():
	_status = "default"
	_animation_player.play(_status)

func edgy():
	_status = "edgy"
	_animation_player.play(_status)

func happy():
	_status = "edgy"
	_animation_player.play(_status)

func serious():
	_status = "serious"
	_animation_player.play(_status)

func worried():
	_status = "worried"
	_animation_player.play(_status)

func victory():
	_status = "victory"
	_animation_player.play(_status)

func victoryFlag():
	_status = "victoryFlag"
	_animation_player.play(_status)
#endregion

#region Actions
func angry():
	if (_animation_player.has_animation(_status+"Angry")):
		_animation_player.play(_status+"Angry")
	else:
		_animation_player.play(_status)

func cry():
	_animation_player.play("cry")

func mock():
	_animation_player.play("happyMocking")

func sleep():
	_animation_player.play("sleeping")

func talk():
	if (_animation_player.has_animation(_status+"Talking")):
		_animation_player.play(_status+"Talking")
	else:
		print_debug("Emotion NOT FOUND: " + _status+"Talking")
		_animation_player.play("defaultTalking")
#endregion

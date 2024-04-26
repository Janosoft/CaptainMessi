extends AnimatedSprite2D

@onready var _animation_player = $AnimationPlayer

#region Situations
func cornerAwayLeft():
	_animation_player.play("cornerKickAwayLeft")

func cornerHomeLeft():
	_animation_player.play("cornerKickHomeLeft")

func penaltyKick():
	_animation_player.play("penaltyKick")
#endregion

#region Actions
func goalAwaySide():
	_animation_player.play("goalAwaySide")

func goalHomeSide():
	_animation_player.play("goalHomeSide")

func postImpactLeft():
	_animation_player.play("postImpactLeft")

func postImpactRight():
	_animation_player.play("postImpactRight")
#endregion

#region Penalties
func penaltyShoot():
	_animation_player.play("penaltyShoot")

func penaltyRivalryLeft():
	_animation_player.play("penaltyRivalryLeft")
	
func penaltyRivalryMiddle():
	_animation_player.play("penaltyRivalryMiddle")

func penaltyRivalryRight():
	_animation_player.play("penaltyRivalryRight")
#endregion

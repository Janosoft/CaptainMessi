extends AnimatedSprite2D

@onready var _animation_player = $AnimationPlayer
@onready var _name = $Name
@onready var pl_guts_points = $PlayerStats/GutsPoints
@onready var pl_dribble_points = $PlayerStats/DribblePoints
@onready var pl_pass_points = $PlayerStats/PassPoints
@onready var pl_shot_points = $PlayerStats/ShotPoints
@onready var gk_guts_points = $GoalKeeperStats/GutsPoints
@onready var gk_puch_points = $GoalKeeperStats/PuchPoints
@onready var gk_catch_points = $GoalKeeperStats/CatchPoints

func showGoalKeeperStats(currentGoalKeeper: Goalkeeper):
	_animation_player.stop()
	_name.text = "GK " + currentGoalKeeper.playerName
	gk_guts_points.text = str(currentGoalKeeper.gutsCount)
	gk_puch_points.text = str(currentGoalKeeper.punchCount)
	gk_catch_points.text = str(currentGoalKeeper.catchCount)
	_animation_player.play("showGoalKeeperStats")

func showPlayerStats(currentPlayer: Player):
	_animation_player.stop()
	_name.text = str(currentPlayer.playerNumber) + " " + currentPlayer.playerName
	pl_guts_points.text = str(currentPlayer.gutsCount)
	pl_dribble_points.text = str(currentPlayer.dribbleCount)
	pl_pass_points.text = str(currentPlayer.passCount)
	pl_shot_points.text = str(currentPlayer.shotCount)
	_animation_player.play("showPlayerStats")

func hideStats():
	_animation_player.stop()
	_animation_player.play("hide")

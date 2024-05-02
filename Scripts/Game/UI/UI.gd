@icon("../module.svg")
extends Node2D
class_name UI

@onready var _relator = $Relator
@onready var _time = $Time
@onready var _teams = $Teams
@onready var _balloon = $Balloon
@onready var _pk : UI_Pk = $Pk
@onready var _stats = $Stats
@onready var _actions : UI_Actions = $Actions

func _showRelator():
	_relator.showRelator()

func _hideRelator():
	_relator.hideRelator()

func _showTime():
	_time.showTime()

func _hideTime():
	_time.hideTime()

func _showTeams():
	_teams.showTeams()

func _hideTeams():
	_teams.hideTeams()

func _showBalloon(type : String, scream: bool):
	if scream:
		match type:
			"small": _balloon.showSmallScreamBalloon()
			_: _balloon.showSmallScreamBalloon()
	else:
		match type:
			"big": _balloon.showBigBalloon()
			"medium": _balloon.showMediumBalloon()
			"small": _balloon.showSmallBalloon()
			_: _balloon.showSmallBalloon()

func _hideBalloon():
	_balloon.hideBalloon()

func _showPk():
	_pk.showPK()

func _hidePk():
	_pk.hidePK()

func showPlayerStats(currentPlayer : Player):
	_stats.showPlayerStats(currentPlayer)

func showGoalKeeperStats(currentGoalKeeper: Goalkeeper):
	_stats.showGoalKeeperStats(currentGoalKeeper)

func _hideStats():
	_stats.hideStats()

func _showActions():
	_actions.showActions()
	
func _hideActions():
	_actions.hideActions()

func penaltyKickChoose():
	_showPk()
	_showActions()
	setActionLabel("Direction")
	setActionActivity("")

func penaltyKickShoot():
	_hideActions()
	_hideStats()

func penaltyKickShootTalk():
	_showRelator()
	_relator.talk()
	_showBalloon("small", true)

func setTeam1Name(newName : String):
	_pk.setTeam1Name(newName)

func setTeam2Name(newName : String):
	_pk.setTeam2Name(newName)

func setTeam1Score(newScore : int):
	_pk.setTeam1Score(newScore)

func setTeam2Score(newScore : int):
	_pk.setTeam2Score(newScore)

func setActionLabel(newLabel : String):
	_actions.setLabel(newLabel)

func setActionActivity(newActivity : String):
	_actions.setActivity(newActivity)

func setTimeTitle(newTitle : String):
	_time.setTitle(newTitle)

func setTimeClock(clockTime : String):
	_time.setClock(clockTime)

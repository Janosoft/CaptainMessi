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
	_relator.visible = true

func _hideRelator():
	_relator.visible = false

func _showTime():
	_time.visible = true

func _hideTime():
	_time.visible = false

func _showTeams():
	_teams.visible = true

func _hideTeams():
	_teams.visible = false

func _showBalloon():
	_balloon.visible = true

func _hideBalloon():
	_balloon.visible = false

func _showPk():
	_pk.visible = true

func _hidePk():
	_pk.visible = false

func _showStats():
	_stats.visible = true

func _hideStats():
	_stats.visible = false

func _showActions():
	_actions.visible = true
	
func _hideActions():
	_actions.visible = false

func penaltyKickChoose():
	_showPk()
	_showActions()
	_showStats()

func penaltyKickShoot():
	_hideActions()
	_hideStats()

func penaltyKickShootTalk():
	_relator.play("defaultTalking")
	_showRelator()
	_balloon.play("smallScream")
	_showBalloon()

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

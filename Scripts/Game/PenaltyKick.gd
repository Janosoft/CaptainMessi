extends Node2D

signal gameOver
@export_file("*.tscn") var team1File
@export_file("*.tscn") var team2File
@export_enum("Team 1:1", "Team 2:2") var playerTeam: int
@onready var ui = $Ui

enum Direction {LEFT, CENTER, RIGHT}
var _playerDirection = Direction.CENTER
var _goalkeeperDirection = Direction.CENTER
var _team1 : Node2D
var _team2 : Node2D
var _team1Score = 0
var _team2Score = 0
var _team1RemainingTurns = 5
var _team2RemainingTurns = 5
var _teamTurn : int = 1
var _winner: int = 0

func _ready():
#region SETUP TEAMS
	_team1 = load(team1File).instantiate()
	_team1.position = Vector2(127,84)
	self.add_child(_team1)
	
	_team2 = load(team2File).instantiate()
	_team2.position = Vector2(127,84)
	self.add_child(_team2)
#endregion
#region SETUP TURN
	_teamTurn = randi() % 2 + 1 #RANDOM TURN
	setTurn()
#endregion
#region SETUP UI
	ui.setActionLabel("Direction")
	ui.setActionActivity("")
#endregion


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("Left"):
			if (_teamTurn == playerTeam):_playerDirection = Direction.LEFT
			else: _goalkeeperDirection = Direction.LEFT
			ui.setActionActivity("Left")
		elif event.is_action_pressed("Right"):
			if (_teamTurn == playerTeam): _playerDirection = Direction.RIGHT
			else: _goalkeeperDirection = Direction.RIGHT
			ui.setActionActivity("Right")
		elif event.is_action_pressed("Up"):
			if (_teamTurn == playerTeam): _playerDirection = Direction.CENTER
			else: _goalkeeperDirection = Direction.CENTER
			ui.setActionActivity("Middle")
		elif event.is_action_pressed("Cancel"):
			ui.setActionActivity("")
		elif event.is_action_pressed("Action"):
			ui.setActionActivity("")
			shoot()

func shoot():
	if _teamTurn == playerTeam: _goalkeeperDirection = Direction.values()[randi() % 3]
	else: _playerDirection = Direction.values()[randi() % 3]
	
	if _playerDirection != _goalkeeperDirection:
		goal(_teamTurn)
		print_debug("GOAL: " + Direction.keys()[_playerDirection] + " VS " + Direction.keys()[_goalkeeperDirection])
		pass
	else:
		print_debug("SAVED: " + Direction.keys()[_playerDirection] + " VS " + Direction.keys()[_goalkeeperDirection])
		pass
	
	print_debug(str(_team1Score) + " - " + str(_team2Score))
	
	_winner = isAWinner()
	if _winner:
		print_debug("Winner: " + str(_winner))
	else:
		changeTurn()
		
	#emit_signal("gameOver", "playerWins")
	
func changeTurn():
	if _teamTurn == 1:
		_team1RemainingTurns -=1
		_teamTurn = 2
	else:
		_team2RemainingTurns -=1
		_teamTurn = 1

func setTurn():
	if _teamTurn == playerTeam:
		print_debug("PLAYER HAS TO SHOOT")
		_team1.showPlayer(_team1.goalkeepers.get_child(0).name, "defaultMini")
	else:
		print_debug("PLAYER HAS TO SAVE")
		_team2.showPlayer(_team2.goalkeepers.get_child(0).name, "defaultMini")

func isAWinner()-> int:
	if (_team1Score - (_team2Score + _team2RemainingTurns)) >0 : return 1
	elif (_team2Score - (_team1Score + _team1RemainingTurns)) >0 : return 2
	else: return 0

func goal(team : int):
	if team == 1: _team1Score +=1
	else: _team2Score +=1

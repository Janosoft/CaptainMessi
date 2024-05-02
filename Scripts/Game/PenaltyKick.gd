extends Node2D

signal gameOver
@export_file("*.tscn") var team1File
@export_file("*.tscn") var team2File
@export_enum("Team 1:1", "Team 2:2") var playerTeam: int

@onready var _ui: UI = $Ui
@onready var _animation_player = $AnimationPlayer

enum Direction {LEFT, CENTER, RIGHT}
var _currentPlayer: Player
var _currentGoalKeeper: Goalkeeper
var _playerDirection = Direction.CENTER
var _goalkeeperDirection = Direction.CENTER
var _team1 : Team
var _team2 : Team
var _team1Score = 0
var _team2Score = 0
var _team1RemainingTurns = 5
var _team2RemainingTurns = 5
var _teamTurn : int = 1
var _winner: int = 0

func _ready():
#region SETUP TEAMS
	_team1 = load(team1File).instantiate()
	self.add_child(_team1)
	
	_team2 = load(team2File).instantiate()
	self.add_child(_team2)
#endregion
#region SETUP TURN
	setTurn()
#endregion
#region SETUP UI
	_ui.setTeam1Name(_team1.TeamAbr)
	_ui.setTeam2Name(_team2.TeamAbr)
	_ui.setTeam1Score(_team1Score)
	_ui.setTeam2Score(_team2Score)
	_animation_player.play("RESET")
#endregion

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("Left"):
			if (_teamTurn == playerTeam):_playerDirection = Direction.LEFT
			else: _goalkeeperDirection = Direction.LEFT
			_ui.setActionActivity("Left")
		elif event.is_action_pressed("Right"):
			if (_teamTurn == playerTeam): _playerDirection = Direction.RIGHT
			else: _goalkeeperDirection = Direction.RIGHT
			_ui.setActionActivity("Right")
		elif event.is_action_pressed("Up"):
			if (_teamTurn == playerTeam): _playerDirection = Direction.CENTER
			else: _goalkeeperDirection = Direction.CENTER
			_ui.setActionActivity("Middle")
		elif event.is_action_pressed("Cancel"):
			_ui.setActionActivity("")
		elif event.is_action_pressed("Action"):
			_ui.setActionActivity("")
			shoot()

func shoot():
	#region Calculate Directions
	if _teamTurn == playerTeam: _goalkeeperDirection = Direction.values()[randi() % 3]
	else: _playerDirection = Direction.values()[randi() % 3]
	#endregion
	
	_animation_player.stop()
	_animation_player.play("shoot")
	
	if _playerDirection != _goalkeeperDirection:
		goal(_teamTurn)
	else:
		print_debug("Team "+ str(_teamTurn) +" NO GOAL")
	
	_winner = isAWinner()
	if _winner:
		if _winner == playerTeam:
			emit_signal("gameOver", "playerWin")
			print_debug("playerWin")
		else:
			emit_signal("gameOver", "playerLoose")
			print_debug("playerLoose")
	else:
		changeTurn()
		setTurn()
	
func changeTurn():
	if _teamTurn == 1:
		_team1RemainingTurns -=1
		_teamTurn = 2
	else:
		_team2RemainingTurns -=1
		_teamTurn = 1
	
	#print_debug("TeamTurn: " + str(_teamTurn) + " - Remaining Team1: " +str(_team1RemainingTurns) + " - Rmaining Team2: " + str(_team2RemainingTurns))
	if _team1RemainingTurns == 0 and _team2RemainingTurns == 0 and (_team1Score == _team2Score):
		print_debug("More Turn")
		_team1RemainingTurns +=1
		_team2RemainingTurns +=1

func setTurn():
	if _teamTurn == playerTeam:
		print_debug("PLAYER HAS TO SHOOT")
		_currentGoalKeeper= _team1.getGoalKeeper()
		_currentPlayer= _team2.getPenaltyKicker()
		_ui.showPlayerStats(_currentPlayer)
	else:
		print_debug("PLAYER HAS TO SAVE")
		_currentGoalKeeper= _team2.getGoalKeeper()
		_currentPlayer= _team1.getPenaltyKicker()
		_ui.showGoalKeeperStats(_currentGoalKeeper)

func isAWinner()-> int:
	if (_team1Score - (_team2Score + _team2RemainingTurns)) >0 : return 1
	elif (_team2Score - (_team1Score + _team1RemainingTurns)) >0 : return 2
	else: return 0

func goal(team : int):
	if team == 1:
		_team1Score +=1
		_ui.setTeam1Score(_team1Score)
	else:
		_team2Score +=1
		_ui.setTeam2Score(_team2Score)

func showGoalKeeper():
	_currentGoalKeeper.showGoalKeeper()

func hideGoalKeeper():
	_currentGoalKeeper.hideGoalKeeper()

func showPlayer(animation : String):
	_currentPlayer.showPlayer(animation)

func hidePlayer():
	_currentPlayer.hidePlayer()

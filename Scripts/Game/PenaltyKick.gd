extends Node2D

@export_file("*.tscn") var team1File
@export_file("*.tscn") var team2File
@export_enum("Team 1:1", "Team 2:2") var playerTeam: int
@onready var ui = $Ui

var _team1 : Node2D
var _team2 : Node2D
var _team1Score = 0
var _team2Score = 0
var _teamTurn : int = 1
var _direction: int = 0

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
	_teamTurn= randi() % 2 + 1 #RANDOM TURN
	if _teamTurn == 1:
		_team1.showPlayer(_team1.goalkeepers.get_child(0).name, "defaultMini")
	else:
		_team2.showPlayer(_team2.goalkeepers.get_child(0).name, "defaultMini")
#endregion
#region SETUP UI
	ui.setActionLabel("Direction")
	ui.setActionActivity("")
#endregion

func _process(delta):
	if _teamTurn == playerTeam:
		#Player Moves
		pass
	else:
		#Cpu moves
		pass

func _input(event):
	if event is InputEventKey and _teamTurn == playerTeam:
		if event.is_action_pressed("Left"):
			_direction = -1
			ui.setActionActivity("Left")
		elif event.is_action_pressed("Right"):
			_direction = 1
			ui.setActionActivity("Right")
		elif event.is_action_pressed("Up"):
			_direction = 2
			ui.setActionActivity("Middle")
		elif event.is_action_pressed("Cancel"):
			_direction = 0
			ui.setActionActivity("")
		elif event.is_action_pressed("Action") and _direction:
			shoot()
			ui.setActionActivity("")

func shoot():
	print_debug("Shoot " + str(_direction))
	
func changeTurn():
	_teamTurn= 2 if (_teamTurn == 1) else 1

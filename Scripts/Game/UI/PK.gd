@icon("../module.svg")
extends Sprite2D
class_name UI_Pk

@onready var _team_1_name = $GridContainer/Team1Name
@onready var _team_2_name = $GridContainer/Team2Name
@onready var _team_1_score = $GridContainer/Team1Score
@onready var _team_2_score = $GridContainer/Team2Score
@onready var _animation_player = $AnimationPlayer

func showPK():
	_animation_player.play("show")

func hidePK():
	_animation_player.play("hide")

func setTeam1Name(newName : String):
	_team_1_name.text = newName
	
func setTeam2Name(newName : String):
	_team_2_name.text = newName
	
func setTeam1Score(newScore : int):
	_team_1_score.text = str(newScore)
	
func setTeam2Score(newScore : int):
	_team_2_score.text = str(newScore)

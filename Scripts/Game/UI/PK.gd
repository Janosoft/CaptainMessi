@icon("../module.svg")
extends Sprite2D
class_name UI_Pk

@onready var team_1_name = $GridContainer/Team1Name
@onready var team_2_name = $GridContainer/Team2Name
@onready var team_1_score = $GridContainer/Team1Score
@onready var team_2_score = $GridContainer/Team2Score

func setTeam1Name(newName : String):
	team_1_name.text = newName
	
func setTeam2Name(newName : String):
	team_2_name.text = newName
	
func setTeam1Score(newScore : int):
	team_1_score.text = str(newScore)
	
func setTeam2Score(newScore : int):
	team_2_score.text = str(newScore)

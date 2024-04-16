extends Node2D
@export_file("*.tscn") var team1File
@export_file("*.tscn") var team2File
@onready var team1 = $Team1
@onready var team2 = $Team2

func _ready():
	team1.replace_by(load(team1File).instantiate())
	team2.replace_by(load(team2File).instantiate())
	print_debug(team1.name)
	#team1.getGoalkeeperName()
	#team1.showPlayer(firstTeam.getGoalkeeperName(), "defaultMini")	
	#inter_miami_cf_2023.showPlayer("1 - Callender","defaultMini")

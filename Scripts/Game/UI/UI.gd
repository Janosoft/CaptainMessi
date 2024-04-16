extends Node2D

@export_flags("Relator:1", "Time:2", "Teams:4", "Pk:8", "Balloon:16", "Stats:32", "Actions:64") var elements = 0
@onready var relator = $Relator
@onready var time = $Time
@onready var teams = $Teams
@onready var balloon = $Balloon
@onready var pk = $Pk
@onready var stats = $Stats
@onready var actions = $Actions

func _ready():
	if elements & 1: relator.visible= true
	if elements & 2: time.visible= true
	if elements & 4: teams.visible= true
	if elements & 8: pk.visible= true
	if elements & 16: balloon.visible= true
	if elements & 32: stats.visible= true
	if elements & 64: actions.visible= true

func setActionLabel(label : String):
	actions.setLabel(label)
	
func setActionActivity(activity : String):
	actions.setActivity(activity)

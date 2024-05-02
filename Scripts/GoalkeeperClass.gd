@icon("../module.svg")
extends CharacterBody2D
class_name Goalkeeper

@export var playerName : String
@export var playerNumber : int
@export var playerPosition : int
@export var skinColor: Color = Color(0.996078, 0.8, 0.772549, 1)
@export var hairColor: Color = Color(0.509804, 0.384314, 0.301961, 1)

@export var gutsCount : int = 600
@export var punchCount : int = 8
@export var catchCount : int = 8

@onready var _animation_player = $AnimationPlayer

func showGoalKeeper():
	visible = true

func hideGoalKeeper():
	visible = false

func penaltyKickFlyLeft():
	_animation_player.play("PK Fly Left")

func penaltyKickFlyRight():
	_animation_player.play("PK Fly Left")

func penaltyKickStands():
	_animation_player.play("PK Stand")

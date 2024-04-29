@icon("../module.svg")
extends Node2D
class_name Team

@export var TeamName : String
@export var TeamAbr : String
@export_group("Colors")
@export var SHIRT_1: Color
@export var SHIRT_2: Color
@export var PANTS: Color
@export var SOCKS_1: Color
@export var SOCKS_2: Color
@export var KEEPER_1: Color
@export var KEEPER_2: Color

@onready var _players = $Players
@onready var _goalkeepers = $Goalkeepers

func _ready():
#region Set Players Colors
	for player in _players.get_children():
		player.material= ShaderMaterial.new()
		player.material.shader= preload("res://Shaders/player.gdshader")
		player.material.set_shader_parameter('Shirt_1', SHIRT_1)
		player.material.set_shader_parameter('Shirt_2', SHIRT_2)
		player.material.set_shader_parameter('Pants', PANTS)
		player.material.set_shader_parameter('Socks_1', SOCKS_1)
		player.material.set_shader_parameter('Socks_2', SOCKS_2)
		player.material.set_shader_parameter('Skin', player.skinColor)
		player.material.set_shader_parameter('Hair', player.hairColor)
#endregion
#region Set Goalkeepers Colors
	for goalkeeper in _goalkeepers.get_children():
		goalkeeper.material= ShaderMaterial.new()
		goalkeeper.material.shader= preload("res://Shaders/goalkeeper.gdshader")
		goalkeeper.material.set_shader_parameter('Shirt_1', KEEPER_1)
		goalkeeper.material.set_shader_parameter('Shirt_2', KEEPER_2)
		goalkeeper.material.set_shader_parameter('Skin', goalkeeper.skinColor)
		goalkeeper.material.set_shader_parameter('Hair', goalkeeper.hairColor)
#endregion

func getGoalKeeper() -> Goalkeeper:
	return _goalkeepers.get_child(0)

func getPlayer(playerName : String)-> Player :
	return self.find_child(playerName,true,true)

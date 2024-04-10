extends Node2D

const SHIRT_1: Color = Color(0.945098, 0.658824, 0.686275, 1)
const SHIRT_2: Color = Color(0.917647, 0.556863, 0.666667, 1)
const PANTS: Color = Color(0.886275, 0.564706, 0.588235, 1)
const SOCKS_1: Color = Color(0.886275, 0.564706, 0.588235, 1)
const SOCKS_2: Color = Color(0.917211, 0.680065, 0.683317, 1)
const KEEPER_1: Color = Color(1.0, 0.956, 0.294, 1.0)
const KEEPER_2: Color = Color(0.976, 0.874, 0.0, 1.0)

@onready var players = $Players
@onready var goalkeepers = $Goalkeepers


func _ready():
#region Set Players Colors
	for player in players.get_children():
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
	for goalkeeper in goalkeepers.get_children():
		goalkeeper.material= ShaderMaterial.new()
		goalkeeper.material.shader= preload("res://Shaders/goalkeeper.gdshader")
		goalkeeper.material.set_shader_parameter('Shirt_1', KEEPER_1)
		goalkeeper.material.set_shader_parameter('Shirt_2', KEEPER_2)
		goalkeeper.material.set_shader_parameter('Skin', goalkeeper.skinColor)
		goalkeeper.material.set_shader_parameter('Hair', goalkeeper.hairColor)
#endregion

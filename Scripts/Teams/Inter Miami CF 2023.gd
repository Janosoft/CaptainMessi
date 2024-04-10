extends Node2D

const SHIRT_1: Color = Color(0.945098, 0.658824, 0.686275, 1)
const SHIRT_2: Color = Color(0.917647, 0.556863, 0.666667, 1)
const PANTS: Color = Color(0.886275, 0.564706, 0.588235, 1)
const SOCKS_1: Color = Color(0.886275, 0.564706, 0.588235, 1)
const SOCKS_2: Color = Color(0.917211, 0.680065, 0.683317, 1)

@onready var messi = $"10 - Messi"


# Called when the node enters the scene tree for the first time.
func _ready():
	messi.playerName= "Messi"
	messi.material= ShaderMaterial.new()
	messi.material.shader= preload("res://Shaders/player.gdshader")
	messi.material.set_shader_parameter('Skin', messi.skinColor)
	messi.material.set_shader_parameter('Hair', messi.hairColor)
	messi.material.set_shader_parameter('Shirt_1', SHIRT_1)
	messi.material.set_shader_parameter('Shirt_2', SHIRT_2)
	messi.material.set_shader_parameter('Pants', PANTS)
	messi.material.set_shader_parameter('Socks_1', SOCKS_1)
	messi.material.set_shader_parameter('Socks_2', SOCKS_2)

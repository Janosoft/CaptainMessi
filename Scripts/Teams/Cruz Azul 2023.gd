extends Node2D

const SHIRT_1: Color = Color(0.008, 0.310, 0.918, 1.0)
const SHIRT_2: Color = Color(0.623, 0.055, 0.086, 1.0)
const PANTS: Color = Color(0.0, 0.184, 0.811, 1.0)
const SOCKS_1: Color = Color(0.035, 0.286, 1.0, 1.0)
const SOCKS_2: Color = Color(0.020, 0.169, 0.812, 1.0)
const KEEPER_1: Color = Color(0.521, 0.141, 0.663, 1.0)
const KEEPER_2: Color = Color(0.380, 0.055, 0.565, 1.0)

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
	
func showPlayer(playerName:String, animation:String):
	for child in self.get_children(): child.visible = false
	var player : Node2D = self.find_child(playerName,true,true)
	if player != null:
		player.setAnimation(animation)
		player.get_parent().visible = true
		player.visible = true
	else:
		print_debug(playerName + " NO FUE ENCONTRADO EN " + self.name)

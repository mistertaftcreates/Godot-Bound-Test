extends Node

var player_pos:= Vector2.ZERO
var scene_to_load:= ""

func store_player_pos(new_pos: Vector2):
	player_pos = new_pos

func set_scene_to_load(new_scene: String):
	scene_to_load = new_scene

func load_new_scene():
	get_tree().change_scene(scene_to_load)


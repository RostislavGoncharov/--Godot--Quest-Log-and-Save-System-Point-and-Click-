extends Node2D

enum cycles { CYCLE_1, CYCLE_2 }

var default_data: Dictionary = {
	"scene_to_load": "res://Scenes/Outpost.tscn",
	"camera_position": Vector2(0, 0),
	"scenes_completed": [],
	"interactables_visited": [],
	"game_state": 0
}

var data: Dictionary = {}

func get_value(key):
	return data[key]

func set_value(key, value):
	data[key] = value

func start_game():
	data = default_data.duplicate()
	var scene = data["scene_to_load"]
	get_tree().change_scene(scene)
	
func _ready():
	start_game()
	


extends Node2D

var save_file_path = "res://save.json"

var default_data: Dictionary = {
	"scene_to_load": "res://Scenes/Outpost.tscn",
	"camera_position_x": 0,
	"camera_position_y": 0,
	"screen_number": 0,
	"scenes_completed": [],
	"interactables_visited": [],
	"game_state": "Cycle_1"
}

var data: Dictionary = {}

func get_value(key):
	return data[key]

func set_value(key, value):
	data[key] = value

func start_game():
	var journal_entries_to_load = get_value("interactables_visited")
	for i in journal_entries_to_load:
		Player.get_node("Camera/JournalUI/Journal")._on_new_journal_entry(i)
	
	var scene = get_value("scene_to_load")
	get_tree().change_scene(scene)
	
	var camera_pos_x = get_value("camera_position_x")
	var camera_pos_y = get_value("camera_position_y")
	var scenes_completed = get_value("scenes_completed")
	var interactables_visited = get_value("interactables_visited")
	var game_state = get_value("game_state")
	
	Player.get_node("Camera").offset.x = int(camera_pos_x)
	Player.get_node("Camera").offset.y = int(camera_pos_y)
	Player.get_node("Camera/Controls/JournalButton").set_deferred("visible", true)
	Player.get_node("Camera/NavigationUI/TextureButton").set_deferred("visible", true)
	Player.get_node("Camera/Controls/SaveExitButton").set_deferred("visible", true)
	Player.get_node("Camera").fade_in()
	
func new_game():
	data = default_data.duplicate()

	Player.get_node("Camera").fade_out()
	yield(get_tree().create_timer(1), "timeout")
	start_game()
	
func save_game():
	set_value("scene_to_load", get_tree().current_scene.filename)
	set_value("camera_position_x", Player.get_node("Camera").offset.x)
	set_value("camera_position_y", Player.get_node("Camera").offset.y)
	set_value("screen_number", get_tree().current_scene.screen_number)
	
	var file = File.new()
	file.open(save_file_path, File.WRITE)
	file.store_string(JSON.print(data, "", false))
	file.close()
	
func load_game():
	var file = File.new()
	assert (file.file_exists(save_file_path))
	
	file.open(save_file_path, File.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	data = json.result

	Player.get_node("Camera").fade_out()
	yield(get_tree().create_timer(1), "timeout")
	start_game()

func on_scene_completed():
	var scenes_completed = get_value("scenes_completed")
	if !scenes_completed.has(get_tree().current_scene.name):
		scenes_completed.append(get_tree().current_scene.name)
	set_value("screen_number", 0)
	Player.get_node("Camera").fade_out()
	yield(get_tree().create_timer(1), "timeout")
	Player.get_node("Camera").set_offset(Vector2(0, 0))

	


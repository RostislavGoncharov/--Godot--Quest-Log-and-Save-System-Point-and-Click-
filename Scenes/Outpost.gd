extends Node2D

var scene_number = 0

func _ready():
	Player.get_node("Camera/NavigationUI/TextureButton").connect("pressed", self, "_on_TextureButton_pressed")
	Player.get_node("Camera").set_offset(Vector2(0, 0))
	
func _process(delta):
	
	if scene_number == 2:
		Player.get_node("Camera/NavigationUI/TextureButton").set_disabled(true)
	elif scene_number < 2:
		Player.get_node("Camera/NavigationUI/TextureButton").set_disabled(false)

# Move camera to the next part of the level
func next_stage():
	var camera_point 
	
	scene_number += 1
	
	if scene_number > 2:
		return
	
	match scene_number:
		0:
			camera_point = $Stage1/CameraPoint1
		1: 
			camera_point = $Stage2/CameraPoint2
			GameDataManager.set_value("game_state", 1)
		2: 
			camera_point = $Stage3/CameraPoint3
		_:
			pass
		
	Player.get_node("Camera").fade_out()
	yield(get_tree().create_timer(1), "timeout")
	Player.get_node("Camera").set_offset(Vector2(0, camera_point.global_position.y)) 
	Player.get_node("Camera").fade_in()
			

func _on_TextureButton_pressed():
	next_stage()


func _on_ChangeScene_pressed():
	Player.get_node("Camera").fade_out()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Scenes/ScreenScene.tscn")
	
	

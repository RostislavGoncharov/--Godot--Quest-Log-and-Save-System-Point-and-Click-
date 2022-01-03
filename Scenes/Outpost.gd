extends Node2D

var scene_number = 0

func next_stage():
	var camera_point = $Stage3/CameraPoint3
	
	scene_number += 1
	
	match scene_number:
		0:
			camera_point = $Stage1/CameraPoint1
		1: 
			camera_point = $Stage2/CameraPoint2
		2: 
			camera_point = $Stage3/CameraPoint3
		_:
			pass
		
	$Camera/FadeLayer/TextureRect/AnimationPlayer.play_backwards("fade_in")
	yield(get_tree().create_timer(1), "timeout")
	$Camera.set_offset(Vector2(0, camera_point.global_position.y)) 
	$Camera/FadeLayer/TextureRect/AnimationPlayer.play("fade_in")
			
	
func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _on_TextureButton_pressed():
	next_stage()

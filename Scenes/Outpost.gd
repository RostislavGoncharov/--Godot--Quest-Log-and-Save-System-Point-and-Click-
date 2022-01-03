extends Node2D

func next_stage(camera_point):
	$Camera.set_offset(Vector2(0, camera_point.global_position.y))
	
func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		var camera_point = $Stage3/CameraPoint3
		next_stage(camera_point)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _on_TextureButton_pressed():
	var camera_point = $Stage2/CameraPoint2
	next_stage(camera_point)

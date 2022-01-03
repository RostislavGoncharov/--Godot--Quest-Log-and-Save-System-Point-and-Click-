extends Node2D

func _ready():
	Player.get_node("Camera").fade_in()
	Player.get_node("Camera").set_offset(Vector2(0, 0))

func _on_Button_pressed():
	var video = preload("res://Assets/Video/BOV_Video_Intro.webm")
	$Video.set_stream(video)
	$Video.play()


func _on_Video_finished():
	$Video.stream = null

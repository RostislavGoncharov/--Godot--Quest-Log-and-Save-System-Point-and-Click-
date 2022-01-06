extends Node2D

func _ready():
	Player.get_node("Camera").fade_in()
	Player.get_node("Camera").set_offset(Vector2(0, 0))

func _on_Button_pressed():
	var video = preload("res://Assets/Video/BOV_Video_Intro.webm")
	$Video.set_stream(video)
	$Video.play()
	$Button.set_deferred("visible", false)
	$ScreenButton.set_deferred("visible", true)


func _on_Video_finished():
	$Video.stream = null


func _on_ScreenButton_pressed():
	$Popup.popup()
	$ScreenButton.set_deferred("visible", false)


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/Outpost.tscn")


func _on_CancelButton_pressed():
	$Popup.hide()
	$ScreenButton.set_deferred("visible", true)

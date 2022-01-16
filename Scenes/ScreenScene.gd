extends Node2D

var screen_number = 0

func _ready():
	if GameDataManager.get_value("scenes_completed").has(self.name):
		_on_Button_pressed()
		$Video.disconnect("finished", self, "_on_Video_finished")
		$Video.connect("finished", self, "_on_Video_finished_scene_completed")
	
	Player.get_node("Camera").fade_in()
#	Player.get_node("Camera").set_offset(Vector2(0, 0))

func _on_Button_pressed():
	var video = preload("res://Assets/Video/BOV_Video_Intro.webm")
	$Video.set_stream(video)
	$Video.play()
	$"Interactables/Misc Entry 1".set_deferred("visible", false)
	$ScreenButton.set_deferred("visible", true)


func _on_Video_finished():
	$Video.stream = null

func _on_Video_finished_scene_completed():
	$Video.play()


func _on_ScreenButton_pressed():
	$Popup.popup()
	$ScreenButton.set_deferred("visible", false)





func _on_CancelButton_pressed():
	$Popup.hide()
	$ScreenButton.set_deferred("visible", true)


func _on_FinishButton_pressed():
	GameDataManager.on_scene_completed()
	GameDataManager.save_game()
	get_tree().quit()

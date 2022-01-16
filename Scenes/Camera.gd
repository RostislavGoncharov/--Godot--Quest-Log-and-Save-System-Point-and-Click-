extends Camera2D

func _ready():
	$JournalUI/Journal/ExitButton.connect("pressed", self, "_on_JournalExitButton_pressed")
	
	fade_in()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
		Player.get_node("Camera").fade_in()
	
func fade_in():
	$FadeLayer/TextureRect/AnimationPlayer.play("fade_in")

func fade_out():
	$FadeLayer/TextureRect/AnimationPlayer.play_backwards("fade_in")





func _on_JournalButton_pressed():
	# Displays the correct tab for the current cycle
	match GameDataManager.get_value("game_state"):
		"Cycle_1":
			$JournalUI/Journal/TabContainer.current_tab = 0
		"Cycle_2":
			$JournalUI/Journal/TabContainer.current_tab = 1
		_:
			pass
	$JournalUI/Journal.set_deferred("visible", true)
	$NavigationUI/TextureButton.set_deferred("visible", false)
	$Controls/JournalButton.set_deferred("visible", false)
	
func _on_JournalExitButton_pressed():
	$JournalUI/Journal.set_deferred("visible", false)
	$NavigationUI/TextureButton.set_deferred("visible", true)
	$Controls/JournalButton.set_deferred("visible", true)


func _on_SaveExitButton_pressed():
	GameDataManager.save_game()
	get_tree().quit()

extends Node2D

func _ready():
	var file = File.new()
	if !file.file_exists(GameDataManager.save_file_path):
		$LoadGameButton.disabled = true

func _on_NewGameButton_pressed():
	GameDataManager.new_game()

func _on_LoadGameButton_pressed():
	GameDataManager.load_game()

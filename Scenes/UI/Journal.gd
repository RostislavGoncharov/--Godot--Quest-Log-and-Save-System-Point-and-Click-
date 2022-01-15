extends Control

export (String, FILE, "*.json") var journal_entries_json : String

func _on_new_journal_entry(entry_name):
	var file = File.new()
	assert (file.file_exists(journal_entries_json))
	
	file.open(journal_entries_json, file.READ)
	var entry = parse_json(file.get_as_text())
	var journal_entry_item = preload("res://Scenes/UI/JournalEntry.tscn").instance()
	
	match entry[entry_name]["category"]:
		"Cycle_1":
			Player.get_node("Camera/JournalUI/Journal/TabContainer/Cycle_1/JournalEntries/Cycle1Entries").add_child(journal_entry_item)
		"Cycle_2":
			Player.get_node("Camera/JournalUI/Journal/TabContainer/Cycle_2/JournalEntries/Cycle2Entries").add_child(journal_entry_item)
		_:
			Player.get_node("Camera/JournalUI/Journal/TabContainer/Misc/JournalEntries/MiscEntries").add_child(journal_entry_item)
	
	journal_entry_item.connect("journal_entry_pressed", Player.get_node("Camera/JournalUI/Journal"), "_on_journal_entry_pressed")
	journal_entry_item.title = entry_name
	journal_entry_item.text = entry[entry_name]["name"]
	
	file.close()

func _on_journal_entry_pressed(entry_name):
	var file = File.new()
	assert (file.file_exists(journal_entries_json))
	
	file.open(journal_entries_json, file.READ)
	var entry = parse_json(file.get_as_text())
	
	match entry[entry_name]["category"]:
		"Cycle_1":
			$TabContainer/Cycle_1/EntryText.text = entry[entry_name]["text"]
		"Cycle_2":
			$TabContainer/Cycle_2/EntryText.text = entry[entry_name]["text"]
		_:
			$TabContainer/Misc/EntryText.text = entry[entry_name]["text"]
	
	#$TabContainer/Cycle_1/EntryText.text = entry[entry_name]["text"]
	
	file.close()



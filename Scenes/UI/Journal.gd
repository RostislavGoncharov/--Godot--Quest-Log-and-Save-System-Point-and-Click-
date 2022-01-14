extends Control

func _on_journal_entry_pressed(entry_name):
	$TabContainer/Cycle_1/EntryText.text = "This is " + entry_name

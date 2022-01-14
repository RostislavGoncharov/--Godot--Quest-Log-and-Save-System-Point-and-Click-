extends Button

signal journal_entry_pressed(entry_name)


func _on_JournalEntry_pressed():
	emit_signal("journal_entry_pressed", self.text)

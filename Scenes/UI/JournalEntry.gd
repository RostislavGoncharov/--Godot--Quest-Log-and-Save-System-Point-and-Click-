extends Button

# A prefab for journal entries (UI buttons)

signal journal_entry_pressed(entry_name)

var title : String


func _on_JournalEntry_pressed():
	emit_signal("journal_entry_pressed", title)

extends TextureButton

var visited = false

signal new_journal_entry(name)


func _on_JournalEntryInteractable_pressed():
	if !visited:
		emit_signal("new_journal_entry", self.name)
	
	visited = true

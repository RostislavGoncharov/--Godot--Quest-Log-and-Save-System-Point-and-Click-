extends TextureButton

# A prefab for any points in the game which add a journal entry upon interaction

signal new_journal_entry(name)

func _ready():
	connect("new_journal_entry", Player.get_node("Camera/JournalUI/Journal"), "_on_new_journal_entry")


func _on_JournalEntryInteractable_pressed():
	var visited_array = GameDataManager.get_value("interactables_visited")
	
	if visited_array.has(self.name):
		return
	else:
		emit_signal("new_journal_entry", self.name)
		visited_array.append(self.name)


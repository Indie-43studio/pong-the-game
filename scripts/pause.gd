extends Window

func _back_to_game() -> void:
	self.hide()
	get_tree().paused = false

func _on_continue_pressed() -> void:
	_back_to_game()

func _on_go_back_requested() -> void:
	_back_to_game()

func _on_close_requested() -> void:
	_back_to_game()
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/ui/menu.tscn")

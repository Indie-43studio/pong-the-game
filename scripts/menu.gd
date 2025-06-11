extends CanvasLayer

@export var choose_game_mode: Window

func _on_start_pressed() -> void:
	choose_game_mode.show()

func _on_window_close_requested() -> void:
	choose_game_mode.hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_vs_ai_pressed() -> void:
	if GameManager:
		GameManager.set_game_mode("AI")
		get_tree().change_scene_to_file("res://scences/main.tscn")
		GameManager.ready_serve.emit("player_left")

func _on_vs_player_pressed() -> void:
	if GameManager:
		GameManager.set_game_mode("2P")
		get_tree().change_scene_to_file("res://scences/main.tscn")
		GameManager.ready_serve.emit("player_left")

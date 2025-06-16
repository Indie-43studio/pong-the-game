extends Node

var left_player_score:int = 0
var right_player_score:int = 0
var is_game_over:bool = false
var current_game_mode: String = "AI"
var main_menu_scene_path: String = "res://scences/ui/menu.tscn"

signal point_change
signal ready_serve
signal game_over
signal game_pause

func _ready() -> void:
	current_game_mode = "AI" 
	set_process_unhandled_input(true)
	
func set_game_mode(mode: String):
	current_game_mode = mode

func score_point(scoring_player: String):
	if scoring_player == "player_left":
		left_player_score += 1
		if left_player_score > 10:
			is_game_over = true
			game_over.emit("player_left")
		else:
			point_change.emit("player_left", left_player_score)
			ready_serve.emit("player_left")
		
	elif scoring_player == "player_right":
		right_player_score += 1
		if right_player_score > 10:
			is_game_over = true
			game_over.emit("player_right")
		else:
			point_change.emit("player_right", right_player_score)
			ready_serve.emit("player_right")
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("leave"):
		if is_game_over:
			current_game_mode = "AI"
			is_game_over = false
			left_player_score = 0
			right_player_score = 0
			get_tree().change_scene_to_file(main_menu_scene_path)
		else:
			game_pause.emit()
			

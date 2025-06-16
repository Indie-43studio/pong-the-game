extends Node2D

@export var ball_scene: PackedScene 
@export var left_player_paddle_scene: PackedScene
@export var ai_paddle_scene: PackedScene
@export var right_player_paddle_scene: PackedScene
@export var game_object: Node2D
@export var pause_menu: Window

func _ready() -> void:
	GameManager.connect("game_pause", _pause)
	if GameManager:
		var ball_instance = ball_scene.instantiate()
		game_object.add_child(ball_instance)
		ball_instance.global_position = Vector2.ZERO

		var left_player_paddle_instance = left_player_paddle_scene.instantiate()
		game_object.add_child(left_player_paddle_instance)
		left_player_paddle_instance.global_position = Vector2(-290,0)
		
		if GameManager.current_game_mode == "AI":
			var ai_paddle_instance = ai_paddle_scene.instantiate()
			game_object.add_child(ai_paddle_instance)
			ai_paddle_instance.global_position = Vector2(290,0)
		elif GameManager.current_game_mode == "2P":
			var right_paddle_instance = right_player_paddle_scene.instantiate()
			game_object.add_child(right_paddle_instance)
			right_paddle_instance.global_position = Vector2(290,0)

func _pause() ->void:
	pause_menu.show()
	get_tree().paused = true

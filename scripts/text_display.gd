extends Control

@export var player_left_win: Label
@export var player_right_win: Label
@export var description: Label

func _ready() -> void:
		GameManager.connect("game_over" , game_over)

func game_over(winning_player : String):
	if winning_player == "player_left":
		player_left_win.show()
		description.show()
	elif winning_player == "player_right":
		player_right_win.show()
		description.show()

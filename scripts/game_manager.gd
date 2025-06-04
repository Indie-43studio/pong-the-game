extends Node

var left_player_score:int = 0
var right_player_score:int = 0
var is_game_over:bool = false
signal point_change

func score_point(scoring_player: String):
	if scoring_player == "player_left":
		left_player_score += 1
		point_change.emit("player_left", left_player_score)
	elif scoring_player == "player_right":
		right_player_score += 1
		point_change.emit("player_right", right_player_score)

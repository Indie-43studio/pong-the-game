extends Control

@export var player_left_score_label: Label
@export var player_right_score_label: Label

func _ready() -> void:
	GameManager.connect("point_change" , _update_score)

func _update_score(scoring_player: String, new_total_points: int) -> void:
	if scoring_player == "player_left":
		player_left_score_label.text = str(new_total_points)
	elif scoring_player == "player_right":
		player_right_score_label.text = str(new_total_points)

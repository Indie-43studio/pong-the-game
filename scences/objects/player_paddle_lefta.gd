extends Area2D

var speed: float = 300.0 
var fixed_x_position: float = -290.0

func _physics_process(_delta: float) -> void:
	var vertical_input := Input.get_axis("left_move_up", "left_move_down")
	position.y += vertical_input * speed * _delta
	if global_position.x != fixed_x_position:
		print("Out of box")




func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.bounce_ball(global_position.y, 64)

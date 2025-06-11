extends CharacterBody2D

@export var speed: float = 300.0
@export var deadzone: float = 20.0
@export var tracking_offset: float = randf_range(-30, 30)
var ball: Node2D

func _ready():
	var balls = get_tree().get_nodes_in_group("ball")
	if balls.size() > 0:
		ball = balls[0]

func _physics_process(delta):
	if ball == null:
		return
	
	var target_y = ball.global_position.y + tracking_offset
	var dy = target_y - global_position.y
	
	if abs(dy) > deadzone:
		velocity.y = sign(dy) * speed
	else:
		velocity.y = 0
	
	move_and_slide()

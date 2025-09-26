extends CharacterBody2D
@export var speed: float = 400.0
var max_bounce_angle = deg_to_rad(60)

func _ready():
	position = Vector2.ZERO
	velocity = Vector2.LEFT

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
			velocity = velocity.bounce(collision.get_normal())

func bounce_ball(paddle_position_y, paddle_height):
	var offset_y = global_position.y - paddle_position_y
	var normalized_offset = offset_y / (paddle_height/2)
	var new_angle = normalized_offset * max_bounce_angle
	speed+=10
	velocity = Vector2(-sign(velocity.x) * cos(new_angle), sin(new_angle)).normalized()

extends CharacterBody2D

@export var speed: float = 300.0
var screen_size: Vector2
var max_bounce_angle = deg_to_rad(80)
func _ready():
	velocity = Vector2.LEFT.rotated(randf_range(-0.25, 0.25)) * speed
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()

		if collider.is_in_group("paddle"):
			var offset_y = global_position.y - collider.global_position.y
			var normalized_offset = offset_y / (collider.get_node("CollisionShape2D").shape.height/2)
			var new_angle = normalized_offset * max_bounce_angle
			speed+=10
			velocity = Vector2(-sign(velocity.x) * cos(new_angle), sin(new_angle)).normalized() * speed
		else:
			velocity = velocity.bounce(collision.get_normal())

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.x < (screen_size.x/2):
		GameManager.score_point("player_right")
	else:
		GameManager.score_point("player_left")

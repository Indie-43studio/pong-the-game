extends CharacterBody2D

@export var speed: float = 400.0
var screen_size: Vector2
var max_bounce_angle = deg_to_rad(60)
var current_speed : float = speed
var serve_direction : Vector2
func _ready():
	add_to_group("ball")
	GameManager.connect("ready_serve",new_serve)
	screen_size = get_viewport_rect().size
	position = Vector2.ZERO
	new_serve("player_left")
	


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()

		if collider.is_in_group("paddle"):
			var offset_y = global_position.y - collider.global_position.y
			var normalized_offset = offset_y / (collider.get_node("CollisionShape2D").shape.height/2)
			var new_angle = normalized_offset * max_bounce_angle
			current_speed+=10
			velocity = Vector2(-sign(velocity.x) * cos(new_angle), sin(new_angle)).normalized() * current_speed
		else:
			velocity = velocity.bounce(collision.get_normal())

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	scale = Vector2(0.01,0.01)
	if position.x < (screen_size.x/2):
		GameManager.score_point("player_right")
	else:
		GameManager.score_point("player_left")
		
func new_serve(scoring_player: String):
	global_position = Vector2.ZERO
	velocity = Vector2.ZERO
	current_speed = speed
	if scoring_player == "player_left":
		serve_direction = Vector2.RIGHT
	elif scoring_player == "player_right":
		serve_direction = Vector2.LEFT
	var tween = create_tween() 
	tween.tween_property(self, "scale", Vector2(3,3), 0.3)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "scale", Vector2(1,1), 0.2)\
		.set_ease(Tween.EASE_IN)\
		.set_trans(Tween.TRANS_QUAD)
	await tween.finished 
	velocity = serve_direction.rotated(randf_range(-0.25, 0.25)) * speed
	

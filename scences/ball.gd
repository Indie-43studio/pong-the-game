extends CharacterBody2D

@export var speed: float = 400.0
var screen_size: Vector2
signal screen_exited_left
signal screen_exited_right
func _ready():
	velocity = Vector2.LEFT.rotated(randf_range(-0.25, 0.25)) * speed
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()

		if collider.is_in_group("paddle"):
			var offset_y = global_position.y - collider.global_position.y
			var normalized_offset = offset_y / (collider.get_node("CollisionShape2D").shape.extents.y)
			velocity.x = -velocity.x 
			speed+=10
			velocity.y = normalized_offset * speed
		else:
			velocity = velocity.bounce(collision.get_normal())

		velocity = velocity.normalized() * speed
func _on_visible_on_screen_notifier_2d_screen_exited():
	if position.x < (screen_size.x/2):
		screen_exited_left.emit()
	else:
		screen_exited_right.emit()

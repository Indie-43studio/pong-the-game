extends CharacterBody2D

@export var speed: float = 300.0 
var fixed_x_position: float = 290.0

func _physics_process(_delta: float) -> void:
	var vertical_input: float = Input.get_axis("right_move_up","right_move_down")
	var direction: Vector2 = Vector2(0, vertical_input)
	velocity = direction * speed
	move_and_slide()
	position.x = fixed_x_position

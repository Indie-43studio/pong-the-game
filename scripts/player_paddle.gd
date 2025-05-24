extends CharacterBody2D

@export var speed: float = 300.0 

func _physics_process(_delta: float) -> void:
	var vertical_input: float = Input.get_axis("move_up", "move_down")
	var direction: Vector2 = Vector2(0, vertical_input)
	velocity = direction * speed
	move_and_slide()

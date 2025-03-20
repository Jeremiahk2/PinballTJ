extends RigidBody2D

@onready var orig_pos = position;

func _process(delta: float):
	if Input.is_action_pressed("ui_down"):
		print("Position y: ", position.y);
		if position.y >= orig_pos.y + 60:
			linear_velocity.y = 0;
		else:
			linear_velocity = Vector2(0, 50);
	else:
		if position.y <= orig_pos.y:
			linear_velocity.y = 0;
		else:
			linear_velocity.y = -3500;

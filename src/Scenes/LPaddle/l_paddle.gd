extends RigidBody2D

@onready var startingRotation = transform.get_rotation();
var paddleVelocity = 8;

func _ready():
	pass;

func _physics_process(delta: float):
	var pressed = false;
	angular_velocity = paddleVelocity;
	if transform.get_rotation() >= startingRotation:
		angular_velocity = 0;
	if Input.is_action_pressed("ui_left"):
		angular_velocity = -paddleVelocity;
		if transform.get_rotation() <= -startingRotation:
			angular_velocity = 0;

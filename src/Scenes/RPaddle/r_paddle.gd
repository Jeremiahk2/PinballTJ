extends RigidBody2D

@onready var startingRotation = transform.get_rotation();
var paddleVelocity = 8;

func _ready():
	print(startingRotation);
	print(transform.get_rotation());

func _physics_process(delta: float):
	print(transform.get_rotation());
	var pressed = false;
	angular_velocity = -paddleVelocity;
	if transform.get_rotation() <= startingRotation:
		angular_velocity = 0;
	if Input.is_action_pressed("ui_right"):
		angular_velocity = paddleVelocity;
		if transform.get_rotation() >= -startingRotation:
			angular_velocity = 0;

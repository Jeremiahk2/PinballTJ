extends RigidBody2D

func _ready():
	pass;

func _physics_process(delta: float):
	if Input.is_action_pressed("ui_left"):
		angular_velocity = 2;
	elif Input.is_action_pressed("ui_right"):
		angular_velocity = 0;

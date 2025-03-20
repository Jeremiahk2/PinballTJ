extends RigidBody2D

func _ready():
	body_exited.connect(collided);

func collided(node):
	State.increment_score(node.name);

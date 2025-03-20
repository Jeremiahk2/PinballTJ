extends RigidBody2D

func _ready():
	body_entered.connect(collided);

func collided(node):
	if node.name == "LPaddle":
		print("Collided with Right Paddle")

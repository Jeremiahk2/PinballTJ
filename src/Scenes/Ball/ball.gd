extends RigidBody2D

@onready var sfx = %RockHitSfx

func _ready():
	sfx.stream = load("res://Assets/Audio/metal-tap.mp3")
	body_exited.connect(collided);

func collided(node):
	State.increment_score(node.name, sfx);

extends Area2D

@export var deathParticle: PackedScene
signal coin_destroyed  # Notify spawner when destroyed

var base_position: Vector2  # Stores the initial position
var float_speed := 2.0  # Speed of bouncing
var float_height := 5.0  # Max height to bounce
var time := 0.0  # Timer for sine wave

func _ready():
	base_position = global_position  # Store initial position
	connect("body_entered", _on_body_entered)  # Detect collisions

func _process(delta):
	time += delta * float_speed
	global_position.y = base_position.y + sin(time) * float_height

func _on_body_entered(body):
	if body is RigidBody2D:  # Ensure it's the Ball
		Kill()

func Kill():
	if deathParticle:
		var _particle = deathParticle.instantiate()
		_particle.global_position = global_position
		_particle.global_rotation = global_rotation
		_particle.emitting = true
		get_tree().current_scene.add_child(_particle)

	coin_destroyed.emit()  # Notify the spawner
	queue_free()

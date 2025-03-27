extends Sprite2D

@export var deathParticle : PackedScene

func _ready():
	await get_tree().create_timer(1.0).timeout
	Kill()
	
func Kill():
	var _particle = deathParticle.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	# currently using the one shot option in the editor to play animation once
	# unsure if this is the best way to handle this
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	
	queue_free()

extends Node2D

@export var coin_scene: PackedScene
@export var spawn_interval: float = 2.0  # Time before spawning a new coin

func _ready():
	spawn_coin()

func spawn_coin():
	if coin_scene:
		var coin = coin_scene.instantiate()
		coin.global_position = global_position  # Spawn at spawner's position
		coin.coin_destroyed.connect(_on_coin_destroyed)  # Listen for coin destruction
		add_child(coin)

func _on_coin_destroyed():
	await get_tree().create_timer(spawn_interval).timeout  # Wait before spawning a new coin
	spawn_coin()

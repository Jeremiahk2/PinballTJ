extends Node2D

var score = 0
var lives = 2

func _ready():
    $LoseArea.connect("body_entered", Callable(self, "on_lose_area_body_entered"))

# when entering the LoseArea the ball needs to be respawned. can add a lives system later
func on_lose_area_body_entered(body):
    if body.name == "Ball":
        body.call_deferred("queue_free")
        if lives > 0:
            lives -= 1
            print("lives left: ", lives)
            call_deferred("_respawn_ball")
        else:
            get_tree().change_scene_to_file.call_deferred(("res://Scenes/Main Menu/Main Menu.tscn"))

func _respawn_ball():
    $BallSpawner.ball = null
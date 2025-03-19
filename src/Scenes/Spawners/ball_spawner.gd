extends Node2D

# preload the ball scene
# when the ball is null, instantiate a new ball and add it to the scene
# set the position of the ball to the position of the spawner
var ball_scene = preload("res://Scenes/Ball/Ball.tscn")
var ball = null

func _process(delta):
    if ball == null:
        var new_ball = ball_scene.instantiate()
        new_ball.position = position
        get_parent().add_child(new_ball)
        ball = new_ball
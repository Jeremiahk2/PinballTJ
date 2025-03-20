extends Node2D

var score = 0
var lives = 2

var point_values = {
	"SquareJewel": 100,
	"HeartGem": 50,
	"GoldBar": 10
}

var introDialogue = load("res://Dialogue/intro.dialogue")

func _ready():
	$LoseArea.connect("body_entered", Callable(self, "on_lose_area_body_entered"))
	if !State.intro_done:
		State.intro_done = true;
		DialogueManager.dialogue_ended.connect(startGame)
		DialogueManager.show_dialogue_balloon(introDialogue, "start");
	else:
		startGame(null);

func startGame(resource):
	$BallSpawner.spawn();

# when entering the LoseArea the ball needs to be respawned. can add a lives system later
func on_lose_area_body_entered(body):
	if body.name == "Ball":
		body.call_deferred("queue_free")
		if lives > 0:
			lives -= 1
			print("lives left: ", lives)
			$BallSpawner.call_deferred("spawn")
		else:
			get_tree().change_scene_to_file.call_deferred(("res://Scenes/Main Menu/Main Menu.tscn"))

func on_score_area_body_entered(body):
	if body.name == "ball":
		var parent_name = body.get_parent().name
		if parent_name in point_values:
			increment_score(point_values[parent_name])

func increment_score(value):
	score += value
	print("score: ", score)

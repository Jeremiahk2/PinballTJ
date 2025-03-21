extends Node2D

var lives = 2


var low_ending = load("res://Dialogue/Low_Outcome.dialogue")
var medium_ending = load("res://Dialogue/Medium_Outcome.dialogue")
var high_ending = load("res://Dialogue/High_Outcome.dialogue")
var introDialogue = load("res://Dialogue/intro.dialogue")

func _ready():
	$LoseArea.connect("body_entered", Callable(self, "on_lose_area_body_entered"))
	if !State.intro_done:
		State.intro_done = true;
		DialogueManager.dialogue_ended.connect(startGame)
		DialogueManager.show_dialogue_balloon(introDialogue, "start");
	else:
		startGame(null);

func _input(event: InputEvent):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

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
			DialogueManager.dialogue_ended.disconnect(startGame);
			DialogueManager.dialogue_ended.connect(end_game);
			if (State.score >= 2000):
				DialogueManager.show_dialogue_balloon(high_ending, "start");
			elif (State.score >= 1000):
				DialogueManager.show_dialogue_balloon(medium_ending, "start");
			else:
				DialogueManager.show_dialogue_balloon(low_ending, "start");
func end_game(resource):
	State.score = 0;
	get_tree().change_scene_to_file.call_deferred(("res://Scenes/Main Menu/Main Menu.tscn"))
	

extends Node

signal speaker_changed(speaker: String)

var intro_done = false;

var score = 0;

var point_values = {
	"SquareJewel": 100,
	"HeartGem": 50,
	"GoldBar": 10
}

func increment_score(name):
	var points = point_values.get(name)
	if points != null:
		score += point_values[name];
		print(score);

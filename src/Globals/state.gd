extends Node

signal speaker_changed(speaker: String)

var intro_done = false;

var score = 0;

func _ready():
	pass

var point_values = {
	"SquareJewel": 100,
	"HeartGem": 50,
	"GoldBar": 10,
	"DragonGem": 200
}

func increment_score(name, stream):
	var points = point_values.get(name)
	if points != null:
		score += point_values[name];
		stream.play();

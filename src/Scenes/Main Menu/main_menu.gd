extends Control

func _input(event: InputEvent):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	elif Input.is_anything_pressed():
		get_tree().change_scene_to_file("res://Scenes/Main/Main.tscn")

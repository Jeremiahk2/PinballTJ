extends Control

# play button function
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main/Main.tscn")

# options button function
# this function has not yet been connected to any buttons so it will not run as there is no options menu implemented yet
func _on_options_pressed():
	get_tree().change_scene("res://Scenes/Options/options.tscn")

# quit button function
func _on_quit_pressed():
	get_tree().quit()

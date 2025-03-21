extends RichTextLabel

func _process(delta):
	self.text = " Lives: " + str(State.lives)

extends RichTextLabel

func _process(delta):
	self.text = " Score: " + str(State.score)

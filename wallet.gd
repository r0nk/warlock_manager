extends RichTextLabel

var cash = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "$ "+str(cash)

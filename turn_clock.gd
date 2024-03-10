extends Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$progress.value=100*(time_left/wait_time)

func timeout():
	$"../player".turn()

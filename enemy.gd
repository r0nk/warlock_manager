extends Node2D

func random_color():
	return ["red","green","blue","purple"].pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $health/bar.value<=0:
		$model.color=random_color()
		$health/bar.value=100
		$"../wallet".cash+=randi()%10

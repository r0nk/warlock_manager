@tool
extends Sprite2D

@export var rate = 1.0

var progress = 0.0

func _process(delta):
	progress+=delta*rate
	if(progress>1):
		frame=(1+frame)%hframes
		progress=0

extends Node2D

var speed = 5.0
var f = "holtburg"
var t = "tex"
var traveling = false
var t_progress=0.0

@export var size=1000

func travel(from,to):
	f=from
	t=to
	traveling=true

func _process(delta):
	$size_label.text=str(size)
	if(traveling):
		t_progress+=(delta*speed)/10
		position=$"../roads".travel_location(f,t,t_progress)
		if(t_progress>1):
			traveling=false
			position=$"../roads".travel_location(f,t,1.0)


extends Polygon2D

var max_countdown=0.15

var talk_countdown = max_countdown

var visible_cooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible=(talk_countdown>0)
	if(talk_countdown>0):
		talk_countdown-=delta
		return
	talk_countdown=max_countdown + randf()/10
	get_children().pick_random().play()
	rotation=(randf()*0.3)-0.5

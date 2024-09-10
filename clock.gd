extends Node2D

var turn = 0

var rate = 1

var counter=0

var paused=false

func toggle_pause():
	paused=!paused
	if(paused):
		$pause_button.text="Play"
	else:
		$pause_button.text="Pause"

func turn_all_turnables():
	get_tree().call_group("turnable","turn")

func _process(delta):
	if(paused):
		return
	counter+=delta
	if(counter>rate):
		counter=0
		turn_all_turnables()

extends Node2D

var turn = 0

@export var rate = 1.0

var ttimer=0

var paused=false

signal turned

func toggle_pause():
	paused=!paused
	if(paused):
		$pause_button.text="Play"
	else:
		$pause_button.text="Pause"

func turn_all_turnables():
	turn+=1
	$turn_label.text="Turn: "+str(turn)
	get_tree().call_group("turnable","turn")
	turned.emit()

func _process(delta):
	if(paused):
		return
	ttimer+=delta
	if(ttimer>rate):
		ttimer=0
		turn_all_turnables()

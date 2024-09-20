extends Node2D

var type="farm"

func turn():
	var active = get_node(type)
	$label.text=type
	active.turn()

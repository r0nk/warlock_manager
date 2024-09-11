extends Node2D

var cash=0

func _process(delta):
	$panel/cash.text="$ "+str(cash)

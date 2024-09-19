extends Node2D

var cash=0
var souls=100

func _process(delta):
	$panel/cash.text="$ "+str(cash)+"   * "+str(souls)

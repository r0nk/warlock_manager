extends Node2D

var population = 100

var food = 0

func turn():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	turn()
	$farm.turn()
	$food_supply.text=str(food)

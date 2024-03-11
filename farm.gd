extends Node2D

@export var rate = 10
@export var max_turn_timer = 20
var turn_timer=max_turn_timer

var supply = 0

var revenue = 0

func sell(amount):
	if(amount>supply):
		print("ERROR: cannot sell over supply, canceling transaction")
		return
	#$"../market".sell("wheat",supply)
	$"../".food+=amount
	supply-=amount

func harvest():
	supply+=rate

func turn():
	if(turn_timer<=0):
		harvest()
		sell(supply)
		turn_timer=max_turn_timer

	turn_timer-=1


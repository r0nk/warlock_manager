extends Node2D

@export var rate = 100
@export var chance=5
@export var max_turn_timer = 4
var turn_timer=max_turn_timer

var supply = 0

var revenue = 0

func sell(amount):
	if(amount>supply):
		print("ERROR: cannot sell over supply, canceling transaction")
		return
	#$"../market".sell("wheat",supply)
	$"../../".food+=amount
	supply-=amount

func harvest():
	var c=chance
	supply+=rate+((randi()%(c*2))-c)

func turn():
	if(turn_timer<=0):
		harvest()
		sell(supply)
		turn_timer=max_turn_timer

	turn_timer-=1


extends Node2D

var population = 100

var food = 0

func feed():
	food-=population/100
	if(food>20):
		food-=10
		population+=1
	if(food<-10): #starvation
		population-1
	if(food<-30): #canibalism
		population-1
		food+=3

func turn():
	$farm.turn()
	feed()
	$food_supply.text=str(food)
	$population.text=str(population)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	turn()

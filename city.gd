extends Node2D

var population = 100

var food = 0

var character_scene = preload("res://character.tscn")

func spawn_character():
	var c = character_scene.instantiate()
	get_parent().add_child(c)
#	print("Spawned character.");

func feed():
	food-=population/100
	if(food>20):
		food-=10
		population+=1
		if(randf()<0.1):
			spawn_character()
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

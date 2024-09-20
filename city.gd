extends Node2D

var population = 100

var food = 0

var character_scene = preload("res://character.tscn")

@export var city_name = "Easterly"

func spawn_character():
	var c = character_scene.instantiate()
	add_child(c)
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
	feed()
	$food_supply.text=str(food)
	$population.text=str(population)

func organize_people():
	var point = Vector2(100,0)
	for child in get_children():
		if child.is_in_group("person"):
			child.position=point
			point.y+=40


func _process(delta):
	$label.text=city_name
	organize_people()

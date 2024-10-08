extends Node2D

var population = 100

var food = 500

var character_scene = preload("res://character.tscn")

var possible_names = ["Tex","Holt","Elder","Ash","Ashen","Charm","Voo","Doo","Twilight","Moon","Sol","Rex","Murf","Win","Lock","Bolt","Key","Hex","Prax","Alt","Lys","Nel","Atlas","Hox","Twist","Knarl","Branch","Edge","Wand","Lumen","Depth"]

#how tf do you spell this
var suffixes = ["ville","burg","istan","borough","port","wick","chester","by","stead"]

@export var mayor:Node

@export var city_name = "Easterly"

var selected=false

func on_selected():
	selected=!selected
	for child in get_children():
		if child.is_in_group("vos"):
			child.visible=selected

func spawn_character():
	var c = character_scene.instantiate()
	add_child(c)
#	print("Spawned character.");

func feed():
	food-=population/100
	if(food>20):
		food-=10
		population+=1
		if(randf()<0.3):
			$garrison.size+=1
		if(randf()<0.1):
			spawn_character()
	if(food<-10): #starvation
		population-1
	if(food<-30): #canibalism
		population-1
		food+=3

func tax():
	if(is_instance_valid(mayor)):
#		print("Paying taxes of 1 to ",mayor.full_name)
		mayor.cash+=1
	else:
		$flag.color="gray"
		mayor=null

func turn():
	tax() #always tax before anything else, this is the government we're talking about here.
	feed()
	$food_supply.text="food: "+str(food)
	$population.text="Population: "+str(population)

func organize_people():
	var point = Vector2(100,100)
	for child in get_children():
		if child.is_in_group("person"):
			child.position=point
			point.y+=40

func _process(delta):
	$label.text=city_name
	organize_people()

func name_city():
	var cn = possible_names.pick_random()+suffixes.pick_random()
	for city in get_tree().get_nodes_in_group("citites"):
		if(cn == city.city_name):
			cn = "New "+cn
	city_name = cn
	name=city_name

func _ready():
	for child in get_children():
		if child.is_in_group("vos"):
			child.visible=selected
	name_city()
	$flag.color="gray"

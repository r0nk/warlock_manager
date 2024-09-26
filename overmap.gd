extends Node2D

var city_scene = preload("res://city.tscn")

var rng = RandomNumberGenerator.new()

@export var seed = "Hello world!"

@export var city_count=10

func get_cities_near(city,distance):
	var ret = []
	for c in get_tree().get_nodes_in_group("cities"):
		var d = city.position.distance_to(c.position)
		if(d<distance and d!=0):
			ret.append(c)
	return ret

#reorganize cities to try to get them to a constant distance from each other
func push_pull(desired_radius):
	for c1 in get_tree().get_nodes_in_group("cities"):
		for c2 in get_tree().get_nodes_in_group("cities"):
			var d = c1.position.distance_to(c2.position)
			var di = abs(d-desired_radius)
			if(di<100):
				continue
			if(d<desired_radius): #push
				c2.position-= (c1.position - c2.position)*0.1*(di/100.0)
			else: #pull
				c2.position+= (c1.position - c2.position)*0.001*(di/100.0)

func world_gen():
	rng.seed=seed.hash()
	for c in city_count:
		var city = city_scene.instantiate()
		city.position.x=rng.randi_range(0,1000)
		city.position.y=rng.randi_range(0,1500)
		add_child(city)

	for i in 100:
		push_pull(500)

	for c in get_tree().get_nodes_in_group("cities"):
		for near in get_cities_near(c,500):
			$roads.anew(c.city_name,near.city_name)
	$roads.add_lines_from_graph()


func _ready():
	world_gen()

#func _process(delta):



extends Node2D

var income = 5
var cash = 100

signal got_income

var male_names= [
	"Marcus",
	"David",
	"Chris",
	"Paedrick",
	"Jeston",
	"Darius",
	"Calvor",
	"Hendrick",
	"Jhonny",
	]

var female_names= [
	"Lenore",
	"Rhiannon",
	"Delphine",
	"Thalassa",
	"Seraphine",
	"Spella",
	"Luna",
	]

var last_names= [
	"Smith",
	"Lock",
	"Hail",
	"Soul",
	"Potato",
	"Tomin",
	"Salt",
	"Blaze",
	"Hex",
	"Toad",
	"Vigil",
	"Danger",
	]

var full_name = ""

func generate_character():
	full_name=male_names.pick_random()+" "+last_names.pick_random()
	$portrait/eyes.frame=randi()%$portrait/eyes.hframes
	$portrait/body.frame=randi()%$portrait/body.hframes
	print(full_name," generated")

func _ready():
	generate_character()

func socialize():
	var people = get_tree().get_nodes_in_group("person")
	for person in people:
		if person == $".": #don't talk to yourself.
			continue
		$emotions.small_talk(person)

func turn():
	socialize()

func open_viewer():
	$"../character_viewer".target=$"."
	$"../character_viewer".visible=true

func _process(delta):
	$cash.text=str(cash)
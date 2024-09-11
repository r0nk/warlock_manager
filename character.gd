extends Node2D

var income = 5
var cash = 100

signal got_income

var male_names= [
	"Marcus",
	"David",
	"Chris",
	"Paedrick",
	]

var last_names= [
	"Smith",
	"Lock",
	"Hail",
	"Soul",
	]

var full_name = ""

func generate_character():
	full_name=male_names.pick_random()+" "+last_names.pick_random()
	$portrait/eyes.frame=randi()%$portrait/eyes.hframes
	$portrait/body.frame=randi()%$portrait/body.hframes
	print(full_name," generated")

func _ready():
	generate_character()

func turn():
	pass

func _process(delta):
	$cash.text=str(cash)
	pass

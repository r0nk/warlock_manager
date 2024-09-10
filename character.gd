extends Node2D

@export var contracts:Array[Contract] = []

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

# Called when the node enters the scene tree for the first time.
func _ready():
	full_name=male_names.pick_random()+" "+last_names.pick_random()
	print(full_name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node2D

@export var section: Section

var contract_scene = preload("res://contract.tscn")

var first_party
var second_party

func enact():
	if ! second_party:
		print("ERROR, no party to enact to.")
		return
	var contract = contract_scene.instantiate()
	second_party.add_child(contract)
	if(section.trigger=="income" and section.effect=="tax 10%"):
		second_party.got_income.connect(contract.tax)
	if(section.trigger=="Every Turn" and section.effect=="Pay 10"):
		%clock.turned.connect(contract.pay)
	visible=false

func _process(delta):
	section.trigger = $trigger.text
	section.effect = $effect.text

	if (second_party):
		$portrait/name.text=second_party.full_name
		$portrait/eyes.frame=second_party.get_node("portrait/eyes").frame
		$portrait/body.frame=second_party.get_node("portrait/body").frame
	else:
		$portrait/name.text="No one selected."

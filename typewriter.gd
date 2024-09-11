extends Node2D

@export var section: Contract

var contract_scene = preload("res://contract.tscn")

func enact():
	var contract = contract_scene.instantiate()
	$"../character".add_child(contract)
	if(section.trigger=="income" and section.effect=="tax 10%"):
		$"../character".got_income.connect(contract.tax)
	if(section.trigger=="Every Turn" and section.effect=="Pay 10"):
		%clock.turned.connect(contract.pay)

func _process(delta):
	section.trigger = $trigger.text
	section.effect = $effect.text

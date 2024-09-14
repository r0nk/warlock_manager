extends Node2D

var target

func _ready():
	target = get_node("../alice")

func contract_button_pressed():
	visible=false
	%typewriter.second_party=target
	%typewriter.visible=true


func _process(_delta):
	if !target:
		visible=false
		return
	$panel/name_label.text=target.full_name
	$portrait/eyes.frame=target.get_node("portrait/eyes").frame
	$portrait/body.frame=target.get_node("portrait/body").frame



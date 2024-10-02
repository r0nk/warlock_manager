extends Node2D

var target

func _ready():
	pass

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
	$panel/feelings_label.text=""
	$panel/cash_label.text="$ "+str(target.cash)
	for key in target.get_node("emotions").relationships.keys():
		var feeling = target.get_node("emotions").relationships[key]
		$panel/feelings_label.text+=key+"    "
		$panel/feelings_label.text+=str(feeling.admiration)+" "
		$panel/feelings_label.text+=str(feeling.ecstasy)+" "
		$panel/feelings_label.text+=str(feeling.vigilance)+" "
		$panel/feelings_label.text+=str(feeling.terror)+" "
		$panel/feelings_label.text+="\n"



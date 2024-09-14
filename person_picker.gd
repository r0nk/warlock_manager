extends Node2D

func relist():
	$list.clear()
	var people = get_tree().get_nodes_in_group("person")
	for person in people:
		$list.add_item(person.full_name)

func _ready():
	relist()

var timer = 1
func _process(delta):
	if(!visible):
		return
	timer-=delta
	if(timer<=0):
		timer=1
		relist()



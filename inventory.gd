extends Node2D

@export var weight_limit = 64
var weight=0

@export var items:Array[Item_resource] = []

func add_item(item):
	if(weight_limit< (weight+(item.weight*item.quantity))):
		return false
	weight+=item.weight*item.quantity
	for i in items:
		if(i.type==item.type):
			i.quantity+=item.quantity
			return true
	items.append(item)
	return true

func remove_item(item):
	items.erase(item)
	weight-=item.weight*item.quantity

func test():
	var test_item = Item_resource.new()
	test_item.type="cash"
	test_item.quantity=5
	test_item.weight=0
	add_item(test_item)
	remove_item(test_item)


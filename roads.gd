extends Node2D

#not directed
var graph = []

func add_lines_from_graph():
	for c in get_children():
		c.queue_free()

	for edge in graph:
		var r = Line2D.new()
		r.top_level=false
		var a = get_node("../"+edge[0])
		var b = get_node("../"+edge[1])
		if( !a or !b):
			print("city doesn't exist in roads")
			return
		r.add_point(a.position)
		r.add_point(b.position)
		add_child(r)

#func _process(_delta):
func _ready():
	add_lines_from_graph()

func direct_connection(from,to) -> bool:
	for edge in graph:
		if ( (edge[0]==from and edge[1]==to) or (edge[1]==from and edge[0]==to) ):
			return true
	return false

#add a new road if it doesn't already exist
func anew(from,to):
	if(!direct_connection(from,to)):
		graph.append([from,to])

#TODO a* or whatever from one city to another
func pathfind(from,to):
	return true

func travel_location(from,to,percent):
	if(! get_node("../"+from) or  ! get_node("../"+to)):
		return
	var f=get_node("../"+from).position
	var t=get_node("../"+to).position
	var m = (t-f)*percent
	return f+m



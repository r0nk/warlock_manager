extends Node2D

#not directed
var graph = [["holtburg","easterly"],["easterly","tex"],["tex","holtburg"]]

#func _process(_delta):
func _ready():
	for edge in graph:
		var r = Line2D.new()
		r.top_level=false
		var a = get_node("../"+edge[0])
		var b = get_node("../"+edge[1])
		r.add_point(a.position)
		r.add_point(b.position)
		add_child(r)


func direct_connection(from,to) -> bool:
	for edge in graph:
		if ( (edge[0]==from and edge[1]==to) or (edge[1]==from and edge[0]==to) ):
			return true
	return false

#TODO a* or whatever from one city to another
func pathfind(from,to):
	return true

func travel_location(from,to,percent):
	var f=get_node("../"+from).position
	var t=get_node("../"+to).position
	var m = (t-f)*percent
	return f+m



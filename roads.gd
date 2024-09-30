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

func neighbors(of):
	var ret = []
	for edge in graph:
		if(edge[0]==of):
			ret.append(edge[1])
		if(edge[1]==of):
			ret.append(edge[0])
	return ret

func neighbors_in_set(of,set):
	var ret = []
	for edge in graph:
		if(edge[0]==of and set.has(edge[1])):
			ret.append(edge[1])
		if(edge[1]==of and set.has(edge[0])):
			ret.append(edge[0])
	return ret


func min_key(dictionary,unv):
	var key = ""
	var min = 99999
	for k in dictionary.keys():
		if(dictionary[k]<min and unv.has(k)):
			key=k
			min=dictionary[k]
	return key


#TODO a* or whatever from one city to another
func pathfind(start,end):

	var unvisited = []
	for city in get_tree().get_nodes_in_group("cities"):
		unvisited.append(city.city_name)

	#distance from start
	var dist = {start:0}
	var prev = {start:start}
	for city in unvisited:
		dist[city]=9999
	dist[start]=0

	var current
	while not unvisited.is_empty():
		current=(min_key(dist,unvisited))
		unvisited.erase(current)

		for n in neighbors_in_set(current,unvisited):
			var nd = dist[current] + 1
			if nd < dist[n]:
				dist[n] = nd
				prev[n]=current


	var path = [end]
	var p = prev[end]
	while p != start:
		path.append(p)
		p=prev[p]
	return path

func travel_location(from,to,percent):
	if(! get_node("../"+from) or  ! get_node("../"+to)):
		return
	var f=get_node("../"+from).position
	var t=get_node("../"+to).position
	var m = (t-f)*percent
	return f+m



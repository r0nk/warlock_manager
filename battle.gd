extends Node2D

@export var A:NodePath
@export var B:NodePath

func turn():
	var a = get_node(A)
	var b = get_node(B)
	a.size-=(b.size/100)*(randi()%10)
	b.size-=(a.size/100)*(randi()%10)
	if(a.size<=0):
		a.queue_free()
		victory()
	if(b.size<=0):
		b.queue_free()
		victory()

func victory():
	print("battle won!");
	queue_free()



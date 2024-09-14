extends Node2D

#this is a rather complicated system to determine utility to the character

@export var relationships = {} # feelings about people or things

#terror
#vigilance
#ecstasy
#admiration

#the "big five" personality traits,
#these affect how relationships are changed.
#@export_range(-100,100) var openness: int = 0
#@export_range(-100,100) var conscientiousness: int = 0
#@export_range(-100,100) var extraversion: int = 0
#@export_range(-100,100) var agreeableness: int = 0
#@export_range(-100,100) var neuroticism: int = 0

#personality and culture come later

#when characters talk, they talk about things, and they change eachothers relationship to that thing closer together, based on how much they like each other.


func admire(person):
	if not relationships.has(person.full_name):
		relationships[person.full_name] = Feeling.new()
	relationships[person.full_name].admiration+=1

func lerpy_to(value,target,amount):
	value+=int((value-target)*amount)

func small_talk(with):
	var n=with.full_name
	if not relationships.has(n):
		relationships[n] = Feeling.new()
	if (randi()%4 ==0):
		relationships[n].terror+=randi()%3-1
	if (randi()%4 ==0):
		relationships[n].vigilance+=randi()%3-1
	if (randi()%4 ==0):
		relationships[n].ecstasy+=randi()%3-1
	if (randi()%4 ==0):
		relationships[n].admiration+=randi()%3-1

func gossip(with,about,reflect=true):
	var wfa = with.get_node("emotions").relationships[about]
	lerpy_to(relationships[about].terror,wfa.terror,0.3)
	lerpy_to(relationships[about].vigilance,wfa.vigilance,0.3)
	lerpy_to(relationships[about].ecstasy,wfa.ecstasy,0.3)
	lerpy_to(relationships[about].admiration,wfa.admiration,0.3)

	#TODO maybe make this the distance traveled.
	relationships[with].ecstasy+=1

	if(reflect):
		gossip($".",about,false)

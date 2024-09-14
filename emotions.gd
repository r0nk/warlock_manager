extends Node2D

#this is a rather complicated system to determine utility to the character

@export var relationships = {} # feelings about people or things

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
	if relationships[person.name] == null:
		relationships[person.name] = Feeling.new()
	relationships[person.name].admiration+=1

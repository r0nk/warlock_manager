extends Node2D

@export var contract: Section

signal paid

func pay():
	$"../".cash+=10
	paid.emit()
	$"../".got_income.emit()

func tax():
	$"../".cash-=1
	$"../../resources".cash+=1

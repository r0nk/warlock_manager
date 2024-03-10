extends Node2D

#TODO order resource
# buy/sell, item_id, price, volume, entry date, duration
var orders = []

func fufill_order(order):
	pass

func fufill_orders():
	for order in orders:
		fufill_order(order)

func turn():
	fufill_orders()

extends Node2D

#TODO order resource
# buy/sell, item_id, price, volume, entry date, duration
@export var orders:Array[Market_order] = []

#matches are one way for now
func match_order_pair(a,b):
	if(a.type=="SELL" and b.type=="BUY"):
		if(a.price < b.price):
			#TODO check volume here
			return true
	return false

func fufill_order(order):
	for pm in orders:
		if(match_order_pair(pm,order)):
			orders.erase(pm)
			orders.erase(order)
			print("ORDER PAIR FILLED")
			return

func fufill_orders():
	for order in orders:
		fufill_order(order)

func turn():
	fufill_orders()

func _process(delta):
	turn()

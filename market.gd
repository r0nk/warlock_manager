extends Node2D

var orders:Array[Market_order] = []

const uuid_util = preload('res://addons/uuid.gd')

var turn_counter=0

#matches are one way for now
func match_order_pair(a,b):
	if(a.type=="SELL" and b.type=="BUY"):
		if(a.price <= b.price):
			#TODO check volume here
			return true
	return false

func close_order(order):
	var trader = get_tree().get_nodes_in_group("escrow_"+order.uuid)[0]
	if order.type == "SELL":
		trader.revenue+=order.price
	elif order.type == "BUY":
		print("TODO: BUY");
		#trader.inventory[order.item_id]=order.volume

	orders.erase(order)
	trader.remove_from_group("escrow_"+order.uuid)

func fufill_order(order):
	for pm in orders:
		if(match_order_pair(pm,order)):
			print("ORDER PAIR FILLED",pm.uuid," -> ",order.uuid)
			close_order(pm)
			close_order(order)
			#TODO actually transfer the funds and products around to customers
			return

func add_order(trader,type,item_string,price,volume,duration):
	var order= Market_order.new()
	order.uuid=uuid_util.v4()
	order.type=type
	order.item_id=item_string
	order.price=price
	order.volume=volume
	order.entry_date=turn_counter
	order.duration=duration
	orders.append(order)
	trader.add_to_group("escrow_"+order.uuid)

func fufill_orders():
	for order in orders:
		fufill_order(order)

func turn():
	fufill_orders()
	turn_counter+=1

func _process(delta):
	turn()

func _ready():
	print(uuid_util.v4())
	add_order($"../farm","SELL","wheat",10,10,20)
	add_order($".","BUY","wheat",20,10,20)

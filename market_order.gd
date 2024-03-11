extends Resource
class_name Market_order

@export var uuid:String = "UUID_string"
@export_enum("BUY","SELL") var type:String = "SELL"
@export_enum("wheat") var item_id:String = "wheat"
@export var price:float = 10
@export var volume:float = 1
@export var entry_date:int = 0# turn number
@export var duration:int = 1 #turn count



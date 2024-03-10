extends Resource
class_name Market_order

@export_enum("BUY","SELL") var type:String
@export_enum("wheat") var item_id:String
@export var price:float
@export var volume:float
@export var entry_date:int # turn number
@export var duration:int #turn count



extends MenuButton

func id_pressed(id):
	var popup = get_popup()
	text=popup.get_item_text(id)

func _ready():
	var popup = get_popup()
	popup.connect("id_pressed",id_pressed)

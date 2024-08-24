extends Panel

@export var item_name: String

var texture_inside: Texture2D = null

func _ready():
	texture_inside = load("res://assets/sprites/%s.png" % item_name)
	$TextureRect.texture = texture_inside

func _on_Slot_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		GameManager.emit_signal("item_selected", texture_inside)

extends PopupMenu

func _ready() -> void:
	add_item("Opzione 1", 1)
	add_item("Opzione 2", 2)
	hide()


func _on_mouse_exited() -> void:
	hide()

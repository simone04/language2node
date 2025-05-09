extends GraphEdit

const NODE = preload("res://Scenes/Node.tscn")
const POPUP = preload("res://Scenes/popup_menu.tscn")
var context_menu : PopupMenu

func _ready() -> void:
	context_menu = POPUP.instantiate()
	add_child(context_menu)
	context_menu.connect("id_pressed", Callable(self, "_on_menu_id_pressed"))

func _on_menu_id_pressed(id: int) -> void:
	match id:
		1:
			print("Hai cliccato Opzione 1")
		2:
			print("Hai cliccato Opzione 2")

	
func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node, from_port, to_node, to_port)
	
func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	print("debug connection")
	for con in get_connection_list():
		if con.to_node == to_node and con.to_port == to_port:
			return
	connect_node(from_node, from_port, to_node, to_port)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Add Node"):
		var node = NODE.instantiate()
		node.position_offset = get_viewport().get_mouse_position()
		add_child(node)
	elif event.is_action_pressed("Delete Node"):
		for child in get_children():
			if child is GraphNode and child.selected:
				child.queue_free()


func _on_popup_request(at_position: Vector2) -> void:
	print("palle")
	context_menu.position = get_global_mouse_position()
	context_menu.popup()

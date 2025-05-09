extends GraphNode


@export var input_pins : Array[PinRes] = []
@export var output_pins : Array[PinRes] = []

func _ready() -> void:
	for pin in max(input_pins.size(), output_pins.size()):
		print("a node")
		var node : Control = Control.new()
		node.custom_minimum_size = Vector2(0, 15)
		node.update_minimum_size()
		add_child(node)
		if pin < input_pins.size():
			set_slot_enabled_left(pin, true)
			set_slot_color_left(pin, input_pins[pin].color)
		if pin < output_pins.size():
			set_slot_enabled_right(pin, true)
			set_slot_color_right(pin, output_pins[pin].color)

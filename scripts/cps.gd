extends RichTextLabel

@export var offset := Vector2(0, -50) # 20 pixels above cursor
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func _process(delta):
	position = get_viewport().get_mouse_position() + offset

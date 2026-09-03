extends Label

@onready var screenSize := get_viewport().get_visible_rect().size

var score: int = 0

func _ready() -> void:
	_set_position(Vector2i((screenSize.x / 2) - (size.x / 2), 0))
	pass

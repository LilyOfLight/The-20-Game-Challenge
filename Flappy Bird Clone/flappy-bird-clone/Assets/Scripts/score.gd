extends Label

@onready var screenSize := get_viewport().get_visible_rect().size

var score: int = 0

func _ready() -> void:
	SignalBus.pointScored.connect(_point_scored)
	_set_position(Vector2i((screenSize.x / 2) - (size.x / 2), 0)) # sets the label to the center of the screen
	set_text("Score: " + str(score)) # init the score text to 0
	
#Called whenever the pointScored signal is emit, adds a point to the score total and updates the text
func _point_scored() -> void:
	score += 1
	set_text("Score: " + str(score))

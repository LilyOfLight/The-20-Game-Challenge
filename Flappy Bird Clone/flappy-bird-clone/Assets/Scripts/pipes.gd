extends Node2D

@onready var pipeT = get_node("pipeTop")
@onready var pipeB = get_node("pipeBottom")
@onready var screenSize := get_viewport().get_visible_rect().size

@export var space: int ## For the space between the two pipes, in Px
@export var moveSpeed: int ## How fast the Pipes move towards the player

var rng := RandomNumberGenerator.new()

func _ready():
	set_global_position(Vector2i(screenSize.x - 100, roundi(screenSize.y / 2)))
	print(get_global_position())
	pass
	
func place_pipes():
	var rn: int = rng.randi_range(1,50)
	pass

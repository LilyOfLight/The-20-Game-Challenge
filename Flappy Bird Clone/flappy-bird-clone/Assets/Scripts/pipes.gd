class_name Pipes extends Node2D 


@onready var pipeT := get_node("pipeTop")
@onready var pipeB := get_node("pipeBottom")
@onready var scoreArea := get_node("Area2D")
@onready var screenSize := get_viewport().get_visible_rect().size

@export var space: int ## For the space between the two pipes, in Px
@export var margin: int ## Limits how close the end of the pipes can get to the edges of the screen.
@export var moveSpeed: int ## How fast the Pipes move towards the player

var rng := RandomNumberGenerator.new()

func _ready():
	place_pipes()
	
func _physics_process(delta: float) -> void:
	move_pipes()
	if(get_global_position().x < -100):
		queue_free()
	
func place_pipes() -> void:
	var ptSize = pipeT.get_node("CollisionShape2D").shape.get_rect().size
	var pbSize = pipeB.get_node("CollisionShape2D").shape.get_rect().size
	
	# generates a random int for where the pipes should be placed between the
	# margin and screens height - margin, keeping the ends of the pipes in frame
	var rn: int = rng.randi_range(margin,screenSize.y - margin) 
	
	# sets the collision rect to have a width of one and a size of 2*space. bassically fills one px worth of the empty space between the pipes
	scoreArea.get_child(0).get_shape().set_size(Vector2(1, space * 2))
	
	
	# moves the pipes off screen to the right, also moves to the random point where the pipes open
	set_global_position(Vector2i(screenSize.x + 100, rn)) 
	
	# Adds the opening to the pipes
	pipeT.set_position(Vector2i(0, -space - roundi(ptSize.y / 2))) 
	pipeB.set_position(Vector2i(0, space + roundi(pbSize.y / 2)))
	scoreArea.set_position(Vector2i(ptSize.x / 2, 0)) # places at the edge of the opening

func move_pipes() -> void:
	set_global_position(Vector2i(position.x - moveSpeed, position.y))
	

# checks if the player has entered the score area and emit that it did, then disables itself
func _on_area_2d_body_entered(body: Node2D) -> void:
	SignalBus.pointScored.emit()
	scoreArea.set_disable_mode(true)

extends CharacterBody2D

#Variables
@export_group("Player Settings")
@export var flap_strength: int ## velocity strength upward
@export var gravity: int
var vel : Vector2 = Vector2.ZERO


func _physics_process(delta):
	movePlayer(delta)
	
# Handles the logic for moving the player
func movePlayer(delta):
	vel.y += gravity # Applys gravity every frame
	# checks is the button to flap (ex "space") is just pressed and sets velocity.y = -flap_strength 
	if Input.is_action_just_pressed("Flap"):
		vel.y = -flap_strength
		
	move_and_collide(vel * delta) # pass the velecity * delta to the move function in order to be frame rate independent

extends CanvasLayer

@export var can_pause: bool = true

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Pause") and can_pause:
		pause()
	
	
# Check if the game is paused or not, then pauses or unpauses depend on the state.	
func pause() -> void:
	if get_tree().paused == false:
		get_tree().paused = true # pause
	else:
		get_tree().paused = false # unpause

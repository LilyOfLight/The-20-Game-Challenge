extends CanvasLayer

@export var paused: bool = true
var pccp: bool = true # pccp = player can change pause

func _ready() -> void:
	SignalBus.playerDied.connect(_died)
	SignalBus.restart.connect(_restart)
	pause(paused)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Pause") and pccp:
		paused = !paused # what ever the inverse is
		pause(paused)

# paused the game based on what bool is passed
func pause(p: bool) -> void:
		get_tree().paused = p 
		paused = p
		
func _died() -> void:
	pccp = false
	pause(true)
	pass

func _restart() -> void:
	pccp = true
	pause(false)

extends Node2D

@onready var pipes := load("res://Assets/Scenes/pipes.tscn")
@onready var spawnTimer: Timer = $Timer

#spawns the first set of pipes, and starts the timer for the next should spawn
func _ready() -> void:
	SignalBus.restart.connect(_restart)
	spawnPipes()


func _on_timer_timeout() -> void:
	spawnPipes()
	

func spawnPipes() -> void:
	spawnTimer.start()
	var pi: Pipes = pipes.instantiate()
	add_child(pi)
	
func _restart():
	get_tree().reload_current_scene.call_deferred()

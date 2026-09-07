extends Node

func _ready() -> void:
	SignalBus.playerDied.connect(_died)
	pass
	
	
func _died() -> void:
	pass

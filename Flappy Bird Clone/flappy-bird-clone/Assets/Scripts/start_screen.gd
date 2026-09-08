extends Control


func _process(_delta) -> void:
	if Input.is_action_just_pressed("Pause"):
		queue_free()

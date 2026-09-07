extends CenterContainer

var hs_label: Label

func _ready() -> void:
	hs_label = %HighScore
	
	SignalBus.playerDied.connect(_died)
	
	
func _died():
	hs_label.text = "High Score: " + str(GlobalVars.high_score) #shows the high score
	visible = true


func _on_button_pressed() -> void:
	visible = false
	SignalBus.restart.emit()

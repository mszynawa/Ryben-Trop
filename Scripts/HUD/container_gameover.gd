extends Container

func _ready():
	var button = get_node("PlayAgainBtn")
	button.connect("pressed", self, "_on_button_pressed")
	pass
	
func _on_button_pressed():
	get_tree().reload_current_scene()
	pass
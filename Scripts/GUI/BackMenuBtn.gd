extends TextureButton

func _on_MainMenuBtn_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")
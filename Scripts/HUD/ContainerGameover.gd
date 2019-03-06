extends Control

func _ready():
	pass

func _on_PlayAgainBtn_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().reload_current_scene()
# script: TitleScreen.gd

extends Control

func _ready():
	get_tree().paused = false
	pass

func _on_TextureButton_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().change_scene("res://Scenes/GameRoot.tscn")
	pass

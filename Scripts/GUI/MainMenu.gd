# script: TitleScreen.gd

extends Control

func _ready():
	get_tree().paused = false
	pass

func _on_TextureButton_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		
#warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/GameRoot.tscn")

func _on_ScoreButton_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
#warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Menu/Scoreboard.tscn")

func _on_CreditsButton_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
#warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
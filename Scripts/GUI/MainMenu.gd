# script: TitleScreen.gd

extends Control

func _ready():
	#for button in $Menu/Buttons.get_children():
	#	button.connect("pressed", self, "_on_button_pressed", [button.sceneToLoad])
	
	get_tree().paused = false
	pass

#func _on_button_pressed(sceneToLoad):
#	if sceneToLoad == "Quit":
#		get_tree().quit()
	#else:
		#get_tree().change_scene("res://Scenes/" + sceneToLoad + ".tscn")
		#stage_manager.change_stage("res://GUI/menu/" + sceneToLoad + ".tscn")
#		pass

func _on_StartButton_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().change_scene("res://Scenes/GameRoot.tscn")
	pass
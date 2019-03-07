extends Control

onready var input_field = $InputEdit
func _ready():

	#$Title.text = "ENTER YOUR NAME"
	input_field.visible = true
	#input_field.get_node("Text/Score").text = String(score)
	input_field.grab_focus()
	pass

func _on_PlayAgainBtn_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
#warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
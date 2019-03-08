extends Control

onready var input_field = $InputEdit
var score = null
var nickname = null

func _ready():	
	#$Title.text = "ENTER YOUR NAME"
	input_field.visible = true
	input_field.grab_focus()
	
	#get_node("Text/Score").text = String(score)
	score = global.getPlayerScore()
	get_node("Score").text = String(score)
	pass

func _on_PlayAgainBtn_gui_input(event):
	if event is InputEventScreenTouch and event.pressed:
		global.restartPlayerScore()
#warning-ignore:return_value_discarded
		get_tree().reload_current_scene()

func _on_InputEdit_text_entered(new_text):
	nickname = new_text
	$GameJoltAPI.open_session()
	pass

#warning-ignore:unused_argument
func _on_GameJoltAPI_api_session_opened(success):
	$GameJoltAPI.add_score(str(score), int(score), "", "", str(nickname)) #str(score), int(score))
	#utils.get_main_node().get_node("GameJoltAPI").fetch_tables()
	pass # Replace with function body.

#warning-ignore:unused_argument
func _on_GameJoltAPI_api_scores_added(success):
	print("sukces")
	pass # Replace with function body.
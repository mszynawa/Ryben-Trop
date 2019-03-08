extends Control

#warning-ignore:unused_class_variable
var maxScores = 10

func _ready():
	$GameJoltAPI.open_session()
	pass

#warning-ignore:unused_argument
func _on_GameJoltAPI_api_session_opened(success):
	$GameJoltAPI.fetch_scores("10")
	pass

func _on_GameJoltAPI_api_scores_fetched(data):
	data = parse_json(data)
	print(data["response"]["scores"].size())

	for i in range(data["response"]["scores"].size()):
		#print(s[0]["response"]["scores"])
		var label = preload("res://Scenes/Menu/ScoreLabel.tscn").instance()
		var guest_name = data["response"]["scores"][i]["guest"]
		if (guest_name == ""):
			label.get_node("NicknameLabel").text = data["response"]["scores"][i]["user"]
		else:
			label.get_node("NicknameLabel").text = data["response"]["scores"][i]["guest"]
		label.get_node("ScoreLabel").text = data["response"]["scores"][i]["score"]
		get_node("VBoxContainer").add_child(label)
	pass

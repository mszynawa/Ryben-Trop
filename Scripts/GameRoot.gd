extends Spatial

func _ready():
	get_tree().paused = false
	var player = utils.get_main_node().get_node("Fish")
	player.connect("playerDead", self, "onPlayerDead")
	pass

func onPlayerDead():
	print("[GameRoot] Fish dead.")
	
	var gameover = preload("res://Scenes/HUD/container_gameover.tscn").instance()
	get_node("hud").add_child(gameover)
	pass
extends Spatial

var timer = null

signal addScore

func _ready():
	get_tree().paused = false
	var player = utils.get_main_node().get_node("Fish")
	player.connect("playerDead", self, "onPlayerDead")
	
	#Timer
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "onTimerTimeout")
	timer.set_wait_time(1.0)
	timer.set_one_shot(true)
	timer.start()
	pass

func onPlayerDead():
	print("[GameRoot] Fish dead.")
	
	var gameover = preload("res://Scenes/HUD/ContainerGameover.tscn").instance()
	get_node("hud").add_child(gameover)
	pass

func onTimerTimeout():
	
	pass
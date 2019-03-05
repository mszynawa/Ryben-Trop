extends Spatial

var timer = null
var gameTime = 0

export var intervalArray = [ 0, 10, 20, 30, 40, 50 ]
var player = null

# Time vars
var time = 0
var time_mult = 1.0

signal changeScore

func _ready():
	get_tree().paused = false
	player = utils.get_main_node().get_node("Fish")
	player.connect("playerDead", self, "onPlayerDead")
	
	#Timer
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(1.0)
	timer.connect("timeout", self, "onTimerTimeout")
	timer.start()
	add_child(timer)

	pass

func onPlayerDead():
	print("[GameRoot] Fish dead.")
	
	var gameover = preload("res://Scenes/HUD/ContainerGameover.tscn").instance()
	get_node("hud").add_child(gameover)
	pass

func onTimerTimeout():
	#gameTime = gameTime + 1
	#print(gameTime)

	#if (gameTime <= 15):
	#	player.speed = player.speed + 10
	#	pass
		
	global.setPlayerScore(1)
	emit_signal("changeScore")
	
func _physics_process(delta):
	time += delta * time_mult
	
	if (time <= 15):
		player.speed = player.originSpeed + intervalArray[0]
	elif (time  >= 15 and time <= 25):
		player.speed = player.originSpeed + intervalArray[1]
	elif (time  >= 25 and time <= 40):
		player.speed = player.originSpeed + intervalArray[3]
	elif (time  >= 50 and time <= 65):
		player.speed = player.originSpeed + intervalArray[4]
	elif (time  >= 65 and time <= 75):
		player.speed = player.originSpeed + intervalArray[5]
	elif (time  >= 75):
		player.speed = player.originSpeed + intervalArray[6]
		pass
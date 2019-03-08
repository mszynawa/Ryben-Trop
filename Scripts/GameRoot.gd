extends Spatial

var timer = null

export var intervalArray = [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90 ]
var player = null

# Time vars
var time = 0
var time_mult = 1.0

var addScore = 1

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

func _physics_process(delta):
	time += delta * time_mult
	
	if (time <= 5):
		player.speed = player.originSpeed + intervalArray[0]
	elif (time  >= 5 and time <= 15):
		player.speed = player.originSpeed + intervalArray[1]
	elif (time  >= 15 and time <= 25):
		player.speed = player.originSpeed + intervalArray[2]
	elif (time  >= 25 and time <= 35):
		player.speed = player.originSpeed + intervalArray[3]
	elif (time  >= 35 and time <= 45):
		player.speed = player.originSpeed + intervalArray[4]
	elif (time  >= 45 and time <= 55):
		player.speed = player.originSpeed + intervalArray[5]
	elif (time  >= 55 and time <= 65):
		player.speed = player.originSpeed + intervalArray[4]
	elif (time  >= 65 and time <= 75):
		player.speed = player.originSpeed + intervalArray[3]
	elif (time  >= 75 and time <= 85):
		player.speed = player.originSpeed + intervalArray[5]
	elif (time  >= 85 and time <= 95):
		player.speed = player.originSpeed + intervalArray[6]
	elif (time  >= 95 and time <= 105):
		player.speed = player.originSpeed + intervalArray[7]
	elif (time  >= 105 and time <= 115):
		player.speed = player.originSpeed + intervalArray[8]
	elif (time  >= 115):
		player.speed = player.originSpeed + intervalArray[7]
		pass

func onTimerTimeout():
	global.setPlayerScore(addScore)
	emit_signal("changeScore")
extends "res://Scripts/Obstacles/Obstacles.gd"

export var acceleration = 25
export var boostTime = 5
export var takeFuel = 20
export var point = 5

func on_body_entered(body):
	if body.is_in_group("player"):
		#tils.get_main_node().get_node("Player").speed = 50]
		body.get_node("States").fuel = body.get_node("States").fuel - takeFuel
		
		var speed = body.originSpeed
		body.originSpeed = speed + acceleration #speed + (speed * 30 / 100)

		utils.get_main_node().addScore = utils.get_main_node().addScore + point
		var timer = Timer.new()
		timer.set_one_shot(false)
		timer.set_wait_time(boostTime)
		
		timer.start() #to start
		timer.connect("timeout", self, "boost_over", [timer])
		body.add_child(timer) #to process

		hide()
	pass
	
func boost_over(timer):
	var player = utils.get_main_node().get_node("Fish")
	var speed = player.originSpeed
	player.originSpeed = speed - acceleration #speed - (speed * 30 / 100)

	utils.get_main_node().addScore = utils.get_main_node().addScore - point
	timer.queue_free()
	queue_free()
	pass
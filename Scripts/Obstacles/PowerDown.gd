extends "res://Scripts/Obstacles/Obstacles.gd"

func on_body_entered(body):
	if body.is_in_group("player"):
		#tils.get_main_node().get_node("Player").speed = 50]
		var speed = body.speed
		body.speed = speed - 15 #speed + (speed * 30 / 100)
		#print(body.speed)
		
		var timer = Timer.new()
		timer.connect("timeout", self, "boost_over", [timer])
		timer.wait_time = 5
		body.add_child(timer) #to process
		timer.start() #to start
		
		hide()
	pass
	
func boost_over(timer):
	var player = utils.get_main_node().get_node("Fish")
	var speed = player.speed
	player.speed = speed + 15 #speed - (speed * 30 / 100)

	timer.queue_free()
	queue_free()
	pass
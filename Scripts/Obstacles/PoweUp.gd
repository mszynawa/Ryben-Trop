extends "res://Scripts/Obstacles/Obstacles.gd"

func on_body_entered(body):
	if body.is_in_group("player"):
		#tils.get_main_node().get_node("Player").speed = 50]
		var speed = body.speed
		body.speed = speed + (speed * 30 / 100)
		#print(body.speed)
		
	
		var timer = Timer.new()
		timer.connect("timeout", self, "boost_over")
		timer.wait_time = 5
		body.add_child(timer) #to process
		timer.start() #to start
	pass
	
func boost_over():
	var player = utils.get_main_node().get_node("Player")
	var speed = player.speed
	player.speed = speed - (speed * 30 / 100)
	pass
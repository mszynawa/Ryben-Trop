extends Spatial

var timer = null

#export var maxfuel = 200
export var fuel = 100

export var fuelCombustion = [ 7, 6, 5, 4, 3, 2, 1, -1, -5 ]

var parent = null

signal fuel_system(fuel)

func _ready():
	parent = get_parent()
	
	timer = Timer.new()

	timer.set_one_shot(false)
	timer.set_wait_time(1.0)
	timer.connect("timeout", self, "onTimerTimeout")
	timer.start()
	add_child(timer)

func onTimerTimeout():
	if (parent.speed >= 20 and parent.speed < 30):
		fuel = fuel - fuelCombustion[0]
	elif (parent.speed >= 30 and parent.speed < 40):
		fuel = fuel - fuelCombustion[1]
	elif (parent.speed >= 40 and parent.speed < 50):
		fuel = fuel - fuelCombustion[2]
	elif (parent.speed >= 50 and parent.speed < 60):
		fuel = fuel - fuelCombustion[3]
	elif (parent.speed >= 60 and parent.speed < 70):
		fuel = fuel - fuelCombustion[4]
	elif (parent.speed >= 70 and parent.speed < 80):
		fuel = fuel - fuelCombustion[5]
	elif (parent.speed >= 80 and parent.speed < 90):
		fuel = fuel - fuelCombustion[6]
	elif (parent.speed >= 90 and parent.speed < 100):
		fuel = fuel - fuelCombustion[7]
	elif (parent.speed == 100):
		fuel = fuel - fuelCombustion[8]
		
	if (fuel <= 0):
		get_parent().emit_signal("playerDead")
	else:
		emit_signal("fuel_system", fuel)
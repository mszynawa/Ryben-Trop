extends Spatial

export var maxfuel = 200
export var fuel = 100

export var fuelCombustion = [ 7, 6, 5, 4, 3, 2, 1, -1, -5 ]

var parent = null

signal fuel_system(fuel)

func _ready():
	parent = get_parent().get_parent()
	pass
	
func _process(delta):
	#fuel -= fuel * delta
	#fuel = fuel - (delta * 1)
	#fuel = stepify(fuel, 0.01)
	#print(fuel)

	if (parent.speed >= 20 and parent.speed < 30):
		fuel = fuel - fuelCombustion[0]
	elif (parent.speed >= 30 and parent.speed < 40):
		fuel = fuel - fuelCombustion[1]
	
	
	emit_signal("fuel_system", fuel)
	
	
	
	if (fuel <= 0):
		#globals.playerLife -= 1
		#var ship = get_parent().get_parent()
		#ship.fuel_end = true
		return
	pass
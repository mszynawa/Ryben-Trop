extends Spatial

var fuel = 100
var combustion = 5

signal fuel_system(fuel)

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	#fuel -= fuel * delta
	fuel = fuel - (delta * 1)
	#fuel = stepify(fuel, 0.01)
	#print(fuel)
	emit_signal("fuel_system", fuel)
	
	if (fuel <= 0):
		#globals.playerLife -= 1
		#var ship = get_parent().get_parent()
		#ship.fuel_end = true

		return
	pass
extends MeshInstance

export var increaseFuel = 0

func _ready():
	add_to_group("obstacles")
	#get_node("Area").connect("body_entered", self, "on_body_entered")	
	pass
	
func on_body_entered(body):
	if body.is_in_group("player"):
		
		var fuel = body.fuel
		body.fuel = fuel + increaseFuel
	pass

func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		var fish = body.get_node("States/Fuel")
		var fuel = fish.fuel
		
		fish.fuel = fuel + increaseFuel
		if (fish.fuel >= 200):
			fish.fuel = 200
	pass

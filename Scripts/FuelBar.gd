extends TextureProgress

func _ready():
	var player = utils.get_main_node().get_node("Fish").get_node("States")
	player.connect("fuel_system", self, "fuel_system")
	get_parent().get_node("FuelBar").value = player.fuel
	pass

func fuel_system(fuel):
	#get_parent().get_node("fuel_bar").value = fue
	get_parent().get_node("FuelBar").value = fuel
	pass
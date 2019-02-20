extends MeshInstance

func _ready():
	add_to_group("obstacles")
	get_node("Area").connect("body_entered", self, "on_body_entered")	
	pass
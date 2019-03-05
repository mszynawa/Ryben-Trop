extends MeshInstance

signal destroyed

func _ready():
	get_node("Area").connect("body_exited", self, "on_body_exited")
	pass

func on_body_exited(other):
	#print(str('Body exited: ', other))
	#create_explosion()
	#player.queue_free()
	
	if other.is_in_group("player"):
		emit_signal("destroyed", self)
	pass
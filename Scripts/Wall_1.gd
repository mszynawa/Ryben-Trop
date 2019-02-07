extends MeshInstance

onready var endPosition = get_node("Position3D")
onready var player = utils.get_main_node().get_node("Player")
onready var camera = utils.get_main_node().get_node("Camera")

signal destroyed

func _ready():
	#connect("body_entered", self, "on_body_entered")
	player.connect("playerDead", self, "onPlayerDead")
	set_process(true)
	#print(get_parent().translation.x)
	
	#print(get_parent().get_global_transform().origin)
	#print(endPosition.get_global_transform().origin)
	#print(player.get_global_transform().origin)
	#print(camera.get_global_transform().origin)
	pass

# TYMCZASOWA FUNKCJA NA POTRZEBY PROTOTYPU
func onPlayerDead():
	print("[Wall_1] Player dead.")
	set_physics_process(false)
	player.queue_free()
	pass

#func on_body_entered(other):
	#print(str('Body entered: ', other))
	#create_explosion()
	#player.queue_free()
	#pass

func _physics_process(delta):
	#print(camera.get_global_transform().origin.x)
	if endPosition.get_global_transform().origin.x <= player.get_global_transform().origin.x - 100: #player.translation.x >= endPosition.translation.x + 100:
		#self.queue_free()
		emit_signal("destroyed")
		#endPosition.
		#print(endPosition.translation.x)
		#print(player.translation.x)
		#queue_free()
	pass

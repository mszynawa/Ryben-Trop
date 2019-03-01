extends Camera

onready var player = utils.get_main_node().get_node("Fish")

var camera_speed = 25 #player.speed #25
var direction = Vector3()

#onready var player

func _ready():
	#set_fixed_process(true)
	camera_speed = player.speed
	print(player.name)
	set_physics_process(true)
	pass

func _physics_process(delta):
	camera_speed = player.speed
	direction = Vector3(0, 0, 0)
	direction.x += 1
	
	#self.translation(Vector3(direction.x, 0, 0))
	self.translation.x += direction.x * camera_speed * delta
	pass

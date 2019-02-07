extends KinematicBody

var speed = 25
var direction = Vector3(0, 0, 0)
var velocity = Vector3()

#onready var leftScreen = utils.get_main_node().get_node("LeftScreen")
#onready var rightScreen = utils.get_main_node().get_node("RightScreen")
signal playerDead

func _ready():
	#leftScreen.connect("gui_input", self, "change_position")
	pass
	
func _physics_process(delta):
	
	direction = Vector3(0, 0, 0)
	direction.x += 1

	if Input.is_action_pressed("ui_up"):
		direction.z -= 1

	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	
	direction = direction.normalized()
	direction = direction * speed * delta
	
	velocity = move_and_collide(direction)
	#print(velocity)
	if velocity:
		#queue_free()
		emit_signal("playerDead")
	#print(get_transform())
	pass

func _on_LeftScreen_gui_input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	if event is InputEventScreenTouch and event.pressed:
	
		print(event)
		direction = Vector3(0, 0, 0)
		direction.z -= 1
		velocity = move_and_collide(direction)
	pass

func _on_RightScreen_gui_input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	if event is InputEventScreenTouch and event.pressed:
		direction = Vector3(0, 0, 0)
		direction.z += 1
		velocity = move_and_collide(direction)
	pass

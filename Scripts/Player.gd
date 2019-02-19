extends KinematicBody

export var speed = 25
var direction = Vector3(0, 0, 0)
var collision = Vector3()

#onready var leftScreen = utils.get_main_node().get_node("LeftScreen")
#onready var rightScreen = utils.get_main_node().get_node("RightScreen")
signal playerDead

func _ready():
	#leftScreen.connect("gui_input", self, "change_position")
	add_to_group("player")
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
	
	collision = move_and_collide(direction)
	
	if collision:
		#print(collision.collider)	
		if not collision.collider.get_parent().is_in_group("obstacles"):
			emit_signal("playerDead")
		#elif collision.collider.get_parent().is_in_group("obstacles"):
		#	collision.collider.get_parent().queue_free()
	pass

func _on_LeftScreen_gui_input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	if event is InputEventScreenTouch and event.pressed:
	
		#print(event)
		direction = Vector3(0, 0, 0)
		direction.z -= 1
		collision = move_and_collide(direction)
	pass

func _on_RightScreen_gui_input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	if event is InputEventScreenTouch and event.pressed:
		direction = Vector3(0, 0, 0)
		direction.z += 1
		collision = move_and_collide(direction)
	pass

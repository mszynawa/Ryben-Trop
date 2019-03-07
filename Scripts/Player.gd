extends KinematicBody

export var speed = 20
#warning-ignore:unused_class_variable
export var originSpeed = 20

#warning-ignore:unused_class_variable
export var minSpeed = 20
#warning-ignore:unused_class_variable
export var maxSpeed = 100

var direction = Vector3(0, 0, 0)
var collision = Vector3()

#var animFishKinematicBody
#onready var leftScreen = utils.get_main_node().get_node("LeftScreen")
#onready var rightScreen = utils.get_main_node().get_node("RightScreen")

signal playerSpeed(speed)
signal playerDead

func _ready():
	#leftScreen.connect("gui_input", self, "change_position")
	#animFish = get_node("AnimationPlayer")
	add_to_group("player")

export var LEFT = Vector3(0, 0, -0.5)
export var RIGHT = Vector3(0, 0, 0.5)

func _physics_process(delta):
	direction = Vector3(1, 0, 0)
	#direction.x += 1

	if Input.is_action_pressed("ui_left"):
		#direction.x += 2
		#direction.z -= 1
		direction += LEFT

	if Input.is_action_pressed("ui_right"):
		#direction.x += 2
		#direction.z += 1
		direction += RIGHT
	
	#direction = direction.normalized()
	direction = direction * speed * delta

	collision = move_and_collide(direction)

	if collision:
		#print(collision.collider)	
		if not collision.collider.get_parent().is_in_group("obstacles"):
			emit_signal("playerDead")
			print("[Player.gd] Fish dead.")
			#self.queue_free()
			
			get_tree().paused = true
		#elif collision.collider.get_parent().is_in_group("obstacles"):
		#collision.collider.get_parent().queue_free()
	emit_signal("playerSpeed", speed)

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
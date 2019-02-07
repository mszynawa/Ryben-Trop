#script: SpawnerWalls

extends Spatial

const scn_walls = preload("res://Scenes/Wall_1.tscn")
const WALL_WIDTH = 300
const AMOUNT_TO_FILL_VIEW = 2

onready var container = get_node("Container")

func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()
		pass
	pass

func spawn_and_move():
	spawn_walls()
	go_next_pos()
	pass

func spawn_walls():
	var new_walls = scn_walls.instance()
	#print(new_walls.translation)
	new_walls.set_transform(get_transform())
	#new_walls.set_transform(get_transform())
	#new_walls.transform(transform)
	new_walls.connect("destroyed", self, "spawn_and_move")
	get_node("Container").add_child(new_walls)
	pass
	
func go_next_pos():
	#var height = Vector3(WALL_WIDTH, 0, 0)
	#print(get_transform().origin)
	#(get_transform().origin + Vector3(WALL_WIDTH, 0, 0))
	#print(translation)
	#print(container.get_global_transform().origin)
	translation = translation + Vector3(WALL_WIDTH, 0, 0)
	#container.get_global_transform().origin = container.get_global_transform().origin + Vector3(WALL_WIDTH, 0, 0)
	#print(container.get_global_transform().origin)
	pass
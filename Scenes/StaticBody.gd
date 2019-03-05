extends StaticBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "on_body_entered")
	pass # Replace with function body.

func on_body_entered(other):
	print(str('Body entered: ', other))
	#create_explosion()
	
	
	pass

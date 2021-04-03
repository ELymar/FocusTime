extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for c in get_children():
		print(c)
		if "BadApp" in c.name:
			c.position += Vector2(0, 1)



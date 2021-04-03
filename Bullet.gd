extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	position = Vector2(position.x, position.y - 12)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -velocity * delta)

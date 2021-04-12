extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(position.x, position.y - 12)
	add_to_group("Bullets")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -velocity * delta)



func _on_Area2D_body_entered(body):
	if body.is_in_group("BadApps"):
		visible = false
		position = Vector2(1000, 1000)
		

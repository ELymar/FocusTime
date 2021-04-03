extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Projectile")
	print(position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += velocity * delta; 

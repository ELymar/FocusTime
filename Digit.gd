extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var digit = 0

func set_digit(digit):
	print("Setting digit", digit)
	self.digit = digit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite.get_frame() != digit:
		$AnimatedSprite.set_frame(digit)

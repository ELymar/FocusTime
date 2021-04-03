extends KinematicBody2D

var Projectile = preload("res://Projectile.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire(event):
	var projectile = Projectile.instance()
	add_child(projectile)
	projectile.scale = Vector2(0, 0)
	projectile.position = position
	projectile.velocity = -100
	

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				fire(event)
				print("Left button was clicked at ", event.position)
			else:
				print("Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
			


var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(round(direction * velocity*delta), 0)
	if position.x > 200 + 124 or position.x < 200 - 124:
		direction *= -1
		

	

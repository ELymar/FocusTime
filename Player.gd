extends KinematicBody2D
onready var Bullet = preload("res://Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	pass # Replace with function body.

func fire():
	var bullet = Bullet.instance()
	get_parent().add_child(bullet)
	bullet.position = position

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				fire()
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
		
		

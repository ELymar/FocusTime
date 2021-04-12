extends KinematicBody2D
onready var Bullet = preload("res://src/Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	pass # Replace with function body.

var playing = false 
func reset():
	position.x = 200
	playing = true

var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !playing: 
		return 
	position += Vector2(round(direction * velocity*delta), 0)
	if position.x > 200 + 124 or position.x < 200 - 124:
		direction *= -1
		
		

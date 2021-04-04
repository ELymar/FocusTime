extends Node2D
var Game = preload("res://Game.tscn")
var Title = preload("res://Title.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var title
var game
var end

func start():
	title.queue_free()
	game = Game.instance()
	

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				start()
				print("Left button was clicked at ", event.position)
			else:
				print("Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
			

# Called when the node enters the scene tree for the first time.
func _ready():
	title = Title.instance()
	add_child(title)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

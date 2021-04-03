extends Node

var Cooldown = preload("res://Cooldown.gd")
var BadApp = preload("res://BadApp.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var spawn_xs = [ 88, 160, 232 ,304 ] 
var cooldown_time = 3
var spawn_cooldown = Cooldown.new(cooldown_time)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_cooldown.tick(delta)
	if spawn_cooldown.is_ready():
		var badApp = BadApp.instance()
		get_parent().add_child(badApp)
		var choice = spawn_xs[randi() % spawn_xs.size()]
		badApp.position = Vector2(choice, 80)
		badApp.scale = Vector2(4, 4)

	
		
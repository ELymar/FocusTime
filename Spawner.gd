extends Node

var Cooldown = preload("res://Cooldown.gd")
var BadApp = preload("res://BadApp.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_BadApp_Killed():
	get_parent().add_to_score(1)

func _on_BadApp_Floored():
	get_parent().decrement_health(1)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var spawn_xs = [ 88, 160, 232 ,304 ] 
var cooldown_time = 3
var spawn_cooldown = Cooldown.new(cooldown_time)
var spawning = true 
func stop():
	spawning = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !spawning:
		return
	
	spawn_cooldown.tick(delta)
	if spawn_cooldown.is_ready():
		var badApp = BadApp.instance()
		get_parent().add_child(badApp)
		var choice = spawn_xs[randi() % spawn_xs.size()]
		badApp.position = Vector2(choice, 100)
		badApp.scale = Vector2(4, 4)
		badApp.connect("BadApp_Killed", self, "_on_BadApp_Killed")
		badApp.connect("BadApp_Floored", self, "_on_BadApp_Floored")
	
		

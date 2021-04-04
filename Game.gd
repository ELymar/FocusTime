extends Node2D
var Spawner = preload("res://Spawner.gd")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
func add_to_score(amount):
	score += amount
	$HUD.set_score(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

onready var spawner = Spawner.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
			



extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var health = 5

func get_score():
	return score 

func set_score(score):
	self.score = score; 
	$Score.set_score(score)
	
func set_health(health):
	self.health = health
	$Battery.set_level(health)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	set_score(score)
	set_health(health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

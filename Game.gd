extends Node2D
var Spawner = preload("res://Spawner.gd")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var health = 5
func add_to_score(amount):
	score += amount
	$HUD.set_score(score)

func decrement_health(amount):
	health -= amount
	$HUD.set_health(health)
	if(health == 0):
		game_over()

func game_over():
	var badApps = get_tree().get_nodes_in_group("BadApps")
	for b in badApps:
		b.velocity = 0
	$Player.velocity = 0
	$Spawner.queue_free()
	print("Game Over!")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
			


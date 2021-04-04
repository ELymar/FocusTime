extends Node2D
var Spawner = preload("res://Spawner.gd")
var Bullet = preload("res://Bullet.tscn")
var Cooldown = preload("res://Cooldown.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var health = 5
var bars = 5
var canShoot = true; 

var cooldownBar = Cooldown.new(5)

func add_to_score(amount):
	score += amount
	$HUD.set_score(score)

func decrement_health(amount):
	health -= amount
	$HUD.set_health(health)
	if(health == 0):
		game_over()

func decrement_bars(amount):
	bars -= amount
	$HUD.set_bars(bars)
	if(bars == 0):
		canShoot = false; 

func increment_bars(amount):
	bars += amount
	$HUD.set_bars(bars)
	if bars > 0: 
		canShoot = true; 
	

var bulletCountdown = 5

func fire():
	if !canShoot: return 
	var bullet = Bullet.instance()
	add_child(bullet)
	bullet.position = $Player.position
	bulletCountdown -= 1
	if bulletCountdown == 0:
		print("Zero countdown")
		decrement_bars(1)
		bulletCountdown = 5
		
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
	cooldownBar.tick(delta)
	if cooldownBar.is_ready() && bars < 5:
		print("incrementing bars")
		increment_bars(1)
		bulletCountdown = 5
		
		
		
			


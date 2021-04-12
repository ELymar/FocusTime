extends Node2D
var Spawner = preload("res://src/Spawner.gd")
var Bullet = preload("res://src/Bullet.tscn")
var Cooldown = preload("res://src/Cooldown.gd")
var Title = preload("res://src/Title.tscn")
var GameOver = preload("res://src/GameOver.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var health = 5
var bars = 5
var canShoot = true; 
var playing = false; 
var title
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

		
#func _unhandled_input(event):
#	if event is InputEventMouseButton:
#		if event.button_index == BUTTON_LEFT:
#			if event.pressed:
#				if !playing:
#					start()
#					title.queue_free()
#				else:
#					fire()
#				print("Left button was clicked at ", event.position)
#			else:
#				print("Left button was released")
#		if event.button_index == BUTTON_WHEEL_DOWN:
#			print("Wheel down")
			

func start():
	$Spawner.reset()
	$Player.reset()
	health = 5
	$HUD.set_health(health)
	bars = 5
	$HUD.set_bars(bars)
	score = 0
	$HUD.set_score(score)
	playing = true
	$Player.velocity = 50

func game_over():
	var badApps = get_tree().get_nodes_in_group("BadApps")
	for b in badApps:
		b.velocity = 0
	$Player.velocity = 0
	$Spawner.stop()
	playing = false
	title = GameOver.instance()
	add_child(title)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	title = Title.instance()
	add_child(title)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !playing: 
		return 
	cooldownBar.tick(delta)
	if cooldownBar.is_ready() && bars < 5:
		print("incrementing bars")
		increment_bars(1)
		bulletCountdown = 5
	#$Button/AnimatedSprite.set_frame(0)
		
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				$Button/AnimatedSprite.set_frame(1)
				if !playing:
					start()
					title.queue_free()
				else:
					fire()
			else:
				$Button/AnimatedSprite.set_frame(0)

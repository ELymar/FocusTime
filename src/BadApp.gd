extends KinematicBody2D
var Cooldown = preload("res://src/Cooldown.gd")
var cooldown = Cooldown.new(1)
var velocityCooldown = Cooldown.new(10)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("BadApps")

var velocity = 50
var health = 100

var shake = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocityCooldown.tick(delta)
	if velocityCooldown.is_ready():
		velocity += 1
	cooldown.tick(delta)
	if(cooldown.is_ready()):
		if $AnimatedSprite.get_frame() == 0:
			$AnimatedSprite.set_frame(1)
		else:
			$AnimatedSprite.set_frame(0)
	position += Vector2(0, 1).normalized() * velocity * delta

signal BadApp_Killed

signal BadApp_Floored

func _on_Area2D_body_entered(body):
	print("BadApp body entered: ", body)
	if body.is_in_group("Bullets"):
		health -= 25
		$AnimatedSprite.set_frame(2)
		if health <= 0:
			queue_free()
			emit_signal("BadApp_Killed")
	if body.is_in_group("Floors") or body.is_in_group("Player"):
		queue_free()
		emit_signal("BadApp_Floored")
			

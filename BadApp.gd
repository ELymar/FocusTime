extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("BadApps")

var velocity = 30
var health = 100

var shake = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, 1).normalized() * velocity * delta

signal BadApp_Killed

signal BadApp_Floored

func _on_Area2D_body_entered(body):
	print("BadApp body entered: ", body)
	if body.is_in_group("Bullets"):
		health -= 50
		if health <= 0:
			queue_free()
			emit_signal("BadApp_Killed")
	if body.is_in_group("Floors") or body.is_in_group("Player"):
		queue_free()
		emit_signal("BadApp_Floored")
			

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(int) var score setget set_score

func set_score(value: int):
	if($DigitThousands != null):
		$DigitThousands.set_digit(value%10000/1000)
	if($DigitHundreds != null):
		$DigitHundreds.set_digit(value%1000/100)
	if($DigitTens != null):
		$DigitTens.set_digit(value%100/10)
	if($DigitOnes != null):
		$DigitOnes.set_digit(value%10)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

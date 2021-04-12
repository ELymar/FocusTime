var time = 0.0
var max_time = 0.0

func _init(max_time):
	self.max_time = max_time
	self.time = 0

func tick(delta):
	time = max(time - delta, 0)

func is_ready():
	if time > 0:
		return false
	time = max_time
	return true
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

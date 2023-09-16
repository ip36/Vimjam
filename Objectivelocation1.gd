extends Area2D
var myposition
@export var myname = "Placeholder"
@export var mynumber = 0
var completed = false
signal playerentered(me)

# Called when the node enters the scene tree for the first time.
func _ready():
	myposition = position
	self.connect("body_entered", Ientered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Ientered(body):
	if body == $"../../Player":
		get_parent().who = self

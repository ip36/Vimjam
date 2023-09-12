extends Button
@export var number = 0
@export var movingplatforms = Node
var pleasework

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self.onpressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pleasework[number]:
		self.visible = true
		set_position(pleasework[number])
	else:
		self.visible = false


func _on_checkpoints_aaaaaaaaaaaaaaaaaaaaaaaa(transmission):
	pleasework = transmission
	
func onpressed():
	get_parent().get_node("Camera2D").enabled = false
	get_parent().get_parent().get_node("Player").get_node("Camera2D").enabled = true
	get_parent().get_parent().get_node("Player").position = pleasework[number]

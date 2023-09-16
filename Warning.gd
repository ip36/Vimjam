extends Label
var kooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if kooldown <= 0:
		visible = false
	else:
		kooldown -= delta


func _on_player_bringuptext():
	visible = true
	kooldown = 0.5

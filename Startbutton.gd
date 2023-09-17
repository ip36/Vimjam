extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	position = $"../../Mainspawnpoint".position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_parent().get_node("Camera2D").enabled = false
	get_parent().get_parent().get_node("Player").get_node("Camera2D").enabled = true
	get_parent().get_parent().get_node("Player").position = $"../../Mainspawnpoint".position
	get_parent().get_parent().get_node("Player").nocontrols = false
	get_parent().get_parent().get_node("Player").velocity = Vector2()

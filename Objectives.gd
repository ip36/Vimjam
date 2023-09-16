extends Node
var objectivescompleted = 0
var kooldown = 0
var waiting = false
var who = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if who:
		get_parent().get_node("CanvasLayer").get_node("Control" + str(who.mynumber)).get_theme().set_color("font_color", "Label", Color(0, 1, 0))
		if not who.completed:
			get_parent().get_node("Player").get_node("Objectivearrowparent" + str(who.mynumber)).get_node("Objectivearrow").visible = false
			who.completed = true
			objectivescompleted += 1
		if objectivescompleted == 3:
			get_tree().change_scene_to_file("res://Win.tscn")
		who = false

extends Node
var incheckpointselect
var carpositions = []
var checkpointcarpositions = []
var respawnposition = Vector2(0, 0)
var checkpointpos1
var checkpointpos2
var checkpointpos3
var gotoscene = false
var test = 1
signal cantthinkofgoodobscenitiesforthisname(transmission1, transmission2, transmission3)


# Called when the node enters the scene tree for the first time.
func _ready():
	if incheckpointselect:
		emit_signal("cantthinkofgoodobscenitiesforthisname", checkpointpos1, checkpointpos2, checkpointpos3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_killbox_body_entered(body):
	for child in get_tree().get_nodes_in_group("Platform"):
		if child.dropped:
			gotoscene = true
	if body == get_parent().get_node("Player") and gotoscene:
		for child in get_tree().get_nodes_in_group("Platform"):
			if checkpointpos1 == null:
				checkpointpos1 = child.global_position
			elif checkpointpos2 == null:
				checkpointpos1 = child.global_position
			elif checkpointpos3 == null:
				checkpointpos1 = child.global_position
		for child in get_parent().get_node("Movingplatforms").get_children():
			carpositions.append(child)
			if child.checkpointhas != null:
				checkpointcarpositions.insert(child.checkpointhas.number, child)
		incheckpointselect = true
		print(incheckpointselect)
		gotoscene = false
		get_tree().change_scene_to_file("res://Selectacheckpoint.tscn")
		print(incheckpointselect)

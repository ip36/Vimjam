extends Node
@export var player = CharacterBody2D
var checkpoints = []
var torespawn
var torespawndistance = 0.0
var respawned = false
var realwho
signal killplayer(checkpoint)
@export var worldspawn = Node2D
var checkpointspositions = []
signal AAAAAAAAAAAAAAAAAAAAAAAA(transmission)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkpointspositions.clear()
	for child in get_tree().get_nodes_in_group("Platform"):
		if child.dropped:
			checkpointspositions.append(child.global_position)
		else:
			checkpointspositions.append(false)
	emit_signal("AAAAAAAAAAAAAAAAAAAAAAAA", checkpointspositions)


func _on_player_dropcpoint(who, platform):
	if who == "Checkpoint1":
		realwho = $Checkpoint1
	elif who == "Checkpoint2":
		realwho = $Checkpoint2
	elif who == "Checkpoint3":
		realwho = $Checkpoint3
	else:
		return
	realwho.dropped = true
	for child in realwho.get_children():
		child.set_deferred("disabled", false)
	var child_node = get_node(who)
	child_node.get_parent().remove_child(child_node)
	get_parent().get_node("Player").platformon.add_child(child_node)
	get_parent().get_node("Player").platformon.checkpointhas = child_node
	child_node.position.y = -40


func _on_killbox_body_entered(body):
	if body == player:
		checkpoints.clear()
		for child in get_tree().get_nodes_in_group("Platform"):
			if child.position.distance_to(get_parent().get_node("Killbox").position) > torespawndistance and child.dropped == true:
				torespawn = child
				torespawndistance = child.position.distance_to(get_parent().get_node("Killbox").position)
				respawned = true
		if respawned == false:
			torespawn = worldspawn
		emit_signal("killplayer", torespawn)
		respawned = false
		torespawndistance = 0.0


func _on_player_undropcpoint(who):
	for item in who:
		for guy in get_tree().get_nodes_in_group("Moveplatform"):
			if guy.checkpointhas == item:
				guy.checkpointhas = null
		item.get_parent().remove_child(item)
		get_parent().get_node("Checkpoints").add_child(item)
		item.position = Vector2(0, 0)
		item.dropped = false
		for child in item.get_children():
			child.set_deferred("disabled", true)
		if item.is_in_group('1'):
			get_parent().get_node("Player").nextcpoint = 1
		elif item.is_in_group('2') and get_parent().get_node("Player").nextcpoint > 1:
			get_parent().get_node("Player").nextcpoint = 2
		elif item.is_in_group('3') and get_parent().get_node("Player").nextcpoint > 2:
			get_parent().get_node("Player").nextcpoint = 3

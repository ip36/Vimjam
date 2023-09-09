extends Node
@export var player = CharacterBody2D
var checkpoints = []
var torespawn
var torespawndistance = 0.0
var respawned = false
var realwho
signal killplayer(checkpoint)
@export var worldspawn = Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_dropcpoint(who):
	if who == "Checkpoint1":
		realwho = $Checkpoint1
	if who == "Checkpoint2":
		realwho = $Checkpoint2
	if who == "Checkpoint3":
		realwho = $Checkpoint3
	realwho.dropped = true
	realwho.position = player.position
	for child in realwho.get_children():
		child.set_deferred("disabled", false)



func _on_killbox_body_entered(body):
	if body == player:
		checkpoints.clear()
		for child in self.get_children():
			if child.position.distance_to(get_parent().get_node("Killbox").position) > torespawndistance and child.dropped == true:
				torespawn = child
				torespawndistance = child.position.distance_to(get_parent().get_node("Killbox").position)
				respawned = true
		if respawned == false:
			torespawn = worldspawn
		emit_signal("killplayer", torespawn)
		respawned = false


func _on_player_undropcpoint(who):
	for item in who:
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

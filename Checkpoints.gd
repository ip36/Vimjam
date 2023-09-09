extends Node
@export var player = CharacterBody2D
var checkpoints = []
var torespawn
var torespawndistance = 0.0
signal killplayer(checkpoint)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in get_children():
		if not child.dropped:
			child.position = player.position


func _on_player_dropcpoint(who):
	if who == "Checkpoint1":
		$Checkpoint1.dropped = true
		for child in $Checkpoint1.get_children():
			child.set_deferred("disabled", false)
	if who == "Checkpoint2":
		$Checkpoint2.dropped = true
		for child in $Checkpoint2.get_children():
			child.set_deferred("disabled", false)
	if who == "Checkpoint3":
		$Checkpoint3.dropped = true
		for child in $Checkpoint3.get_children():
			child.set_deferred("disabled", false)



func _on_killbox_body_entered(body):
	checkpoints.clear()
	for child in get_children():
		if child.position.distance_to(get_parent().get_node("Killbox").position) > torespawndistance:
			torespawn = child
			torespawndistance = child.position.distance_to(get_parent().get_node("Killbox").position)
	emit_signal("killplayer", torespawn)


func _on_player_undropcpoint(who):
	for item in who:
		item.dropped = false
		for child in item.get_children():
			child.set_deferred("disabled", true)

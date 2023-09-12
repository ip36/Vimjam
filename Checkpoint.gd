extends Area2D
var dropped = false
@export var player = CharacterBody2D
@export var number = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body == player:
		player.cpointsin.append(self)
		player.incpoint = true


func _on_body_exited(body):
	if body == player:
		player.cpointsin.erase(self)
		player.incpoint = false

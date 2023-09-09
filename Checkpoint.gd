extends Area2D
var dropped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_parent().get_parent().get_node("Player").cpointsin.append(self)
	get_parent().get_parent().get_node("Player").incpoint = true
	print(get_parent().get_parent().get_node("Player").cpointsin)
	print(get_parent().get_parent().get_node("Player").incpoint)


func _on_body_exited(body):
	get_parent().get_parent().get_node("Player").cpointsin.erase(self)
	get_parent().get_parent().get_node("Player").incpoint = false

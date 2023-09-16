extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("select"):
		if $Camera2D.enabled:
			$Camera2D.enabled = false
			$Camera2D2.enabled = true
		else:
			$Camera2D2.enabled = false
			$Camera2D.enabled = true

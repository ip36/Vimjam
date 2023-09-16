extends CharacterBody2D
@export var destinations = [Vector2(), Vector2(), Vector2(), Vector2(), Vector2()]
@export var delays = [0, 1, 0.5, 1, 0.5]
var stage = 0
var kooldown = 0
var moving = false
@export var speed = 200
var checkpointhas = null

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Area2D").connect("body_entered", self.playeronplatform)
	get_node("Area2D").connect("body_exited", self.playerleaveplatform)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if kooldown <= 0 and moving == false:
		moving = true
		kooldown = delays[stage]
		if destinations[stage].x > position.x:
			$AnimatedSprite2D.frame = 2
			$AnimatedSprite2D.offset = Vector2(3, 0)
		elif destinations[stage].x < position.x:
			$AnimatedSprite2D.frame = 0
			$AnimatedSprite2D.offset = Vector2(-3, 0)
		elif destinations[stage].y < position.y:
			$AnimatedSprite2D.frame = 1
			$AnimatedSprite2D.offset = Vector2(-3, -3)
		elif destinations[stage].y > position.y:
			$AnimatedSprite2D.frame = 3
			$AnimatedSprite2D.offset = Vector2(-3, 3)
	elif moving == false:
		kooldown -= delta
	if moving == true and position == destinations[stage]:
		moving = false
		if stage == destinations.size() - 1:
			stage = 0
		else:
			stage += 1
	elif moving == true:
		position = position.move_toward(destinations[stage], delta * speed)

func playeronplatform(body):
	if body == get_parent().get_parent().get_node("Player"):
		body.platformon = self

func playerleaveplatform(body):
	if body == get_parent().get_parent().get_node("Player"):
		body.platformon = null

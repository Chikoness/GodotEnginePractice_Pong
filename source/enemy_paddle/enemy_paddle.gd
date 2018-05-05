extends KinematicBody2D

var speed = 30.0
var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _process(delta):
	if ball.position.x - position.x > 50:
		position.x = lerp(position.x, position.x + 8, speed * delta)
	elif ball.position.x - position.x < -50:
		position.x = lerp(position.x, position.x - 8, speed * delta)
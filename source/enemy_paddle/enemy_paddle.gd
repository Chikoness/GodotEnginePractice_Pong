extends KinematicBody2D

var speed = 30.0
var _ball_pos

func _on_Ball_ball_pos_set(pos):
	_ball_pos = pos

func _process(delta):
	if _ball_pos.x - position.x > 50:
		position.x = lerp(position.x, position.x + 8, speed * delta)
	elif _ball_pos.x - position.x < -50:
		position.x = lerp(position.x, position.x - 8, speed * delta) 
	
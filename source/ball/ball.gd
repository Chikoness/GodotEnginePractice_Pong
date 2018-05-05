extends KinematicBody2D

export (float) var speed = 250
var direction = Vector2(0.5, 1);

onready var initial_pos = self.position

func reset():
	position = initial_pos
	speed = 250
	direction = Vector2(0.5, 1)

func _process(delta):
	position += direction * speed * delta

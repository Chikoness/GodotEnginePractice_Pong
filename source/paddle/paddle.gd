extends KinematicBody2D
export (float) var ball_dir = 1

func _ready():
	pass

func _process(delta):
	#mouse tracking
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion, 0))
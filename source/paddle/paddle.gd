extends KinematicBody2D

func _process(delta):
	#mouse tracking
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion, 0))

extends KinematicBody2D
export (float) var ball_dir = 1

func _ready():
	pass

func _process(delta):
	#mouse tracking
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
<<<<<<< HEAD
	translate(Vector2(motion, 0))
=======
	translate(Vector2(motion, 0))
>>>>>>> fbef362c12635f2f529a60e565a0ab18fe5081aa

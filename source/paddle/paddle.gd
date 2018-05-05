extends KinematicBody2D
export (float) var ball_dir = 1

func _ready():
	pass

func _process(delta):
	#mouse tracking
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion, 0))
	
func _on_area_entered(area):
	if area.get_name() == "Ball":
		area.direction = Vector2(randf() * 2 - 1, ball_dir).normalized()
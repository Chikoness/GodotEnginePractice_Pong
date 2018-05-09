extends KinematicBody2D

var _is_game_over = false

func _on_World_game_over_set(is_game_over):
	_is_game_over = is_game_over

func _process(delta):
	if !_is_game_over:
		#mouse tracking
		var motion = (get_global_mouse_position().x - get_position().x) * 0.2
		translate(Vector2(motion, 0))

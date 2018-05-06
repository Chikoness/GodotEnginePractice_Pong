extends KinematicBody2D

signal score_added(score)
signal ball_pos_set(pos)

export (float) var bounce = 300.0
export (float) var directional_factor = 10.0
export (int) var points = 100

var _velocity = Vector2(0, bounce)

func _ready():
	emit_signal("ball_pos_set", position)	

func _physics_process(delta):
	# move and collide the ball at a velocity (displacement over time in delta)
	var _col_info = move_and_collide(_velocity * delta)	
	
	if _col_info: # if there is collision
		if _col_info.collider.name.find("Paddle") > -1: # if collide with "Paddle"
			# bounce back direction depends on ball's distance from paddle, then times a number
			_velocity.x = (position.x - _col_info.collider.position.x) * directional_factor
			var _bounce_direction = -sign(_velocity.y)
			_velocity.y = 0 
			_velocity.y += _bounce_direction * bounce
			
	
	if position.x < 0:
		_velocity.x = abs(_velocity.x)
	if position.x > get_viewport_rect().size.x:
		_velocity.x = -abs(_velocity.x)
	
	if position.y < 0:		
		# ball passes enemy // win
		position = Vector2(400, 300)
		_velocity = Vector2(0, -bounce)
		emit_signal("score_added", points)
		
	if position.y > get_viewport_rect().size.y:
		# ball passes player // lose
		position = Vector2(400, 300)
		_velocity = Vector2(0, bounce)

	emit_signal("ball_pos_set", position)
	
extends KinematicBody2D

export (float) var bounce = 600.0
export (float) var directional_factor = 10.0

var _velocity = Vector2(0, bounce)

<<<<<<< HEAD
func reset():
	position = initial_pos
	speed = 250
	direction = Vector2(0.5, 1)

func _process(delta):
	position += direction * speed * delta
	
	var col_info = move_and_collide(speed * delta)
	
	if col_info.collider.name == "Ball":
		direction = Vector2(0.5, -1)
=======
func _physics_process(delta):
	# move and collide the ball at a velocity (displacement over time in delta)
	var _col_info = move_and_collide(_velocity * delta)	
	
	if _col_info: # if there is collision
		if _col_info.collider.name.find("Paddle") > -1: # if collide with "Paddle"
			# bounce back directiion depends on ball's distance from paddle, then times a number
			_velocity.x = (position.x - _col_info.collider.position.x) * directional_factor
			_velocity.y = 0 
			_velocity.y -= bounce
	
	if position.x < 0:
		_velocity.x = abs(_velocity.x)
	if position.x > get_viewport_rect().size.x:
		_velocity.x = -abs(_velocity.x)
	
	if position.y < 0:
		_velocity.y = abs(_velocity.y)
	
>>>>>>> fbef362c12635f2f529a60e565a0ab18fe5081aa

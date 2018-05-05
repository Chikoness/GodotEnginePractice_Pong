extends StaticBody2D

export (float) var y_direction = 1

func _on_area_entered (area):
	if area.get_name() == "Ball":
		area.direction.y = y_direction
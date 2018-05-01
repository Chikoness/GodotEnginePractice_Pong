extends Area2D

func _on_area_wall_entered(area):
	if area.get_name() == "Ball":
		area.reset()
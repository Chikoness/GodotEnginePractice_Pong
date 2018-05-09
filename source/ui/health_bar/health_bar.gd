extends Node2D

export (PackedScene) var HealthSprite = preload("res://ui/health_bar/health_sprite.tscn")

func _on_World_health_bar_set(health):
	for i in get_children():
		i.queue_free()
	
	for i in range(health):
		var health_sprite = HealthSprite.instance()
		add_child(health_sprite)
		
		var start_pos = Vector2(20, get_viewport_rect().size.y - 20)
		
		health_sprite.position.x = start_pos.x + 30 * i 
		health_sprite.position.y = start_pos.y
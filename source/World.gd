extends Node

signal score_text_set(score)
signal health_bar_set(health)
signal game_over_set(is_game_over)

var _current_score = 0
var _current_life = 5
var _is_game_over = false

func _on_Ball_score_added(score):
	_current_score += score
	emit_signal("score_text_set", str(_current_score))

func _on_Ball_ball_dropped():
	if _current_life > 0:
		_current_life -= 1	
		emit_signal("health_bar_set", _current_life)

	if _current_life == 0:
		_is_game_over = true
		get_tree().paused = true

	emit_signal("game_over_set", _is_game_over)
	
	if _is_game_over:
		set_process_input(true)
	
func _ready():
	emit_signal("health_bar_set", _current_life)
	set_process_input(false)
	
func _input(event):
	if event is InputEventKey:
		if event.pressed && event.scancode == KEY_SPACE:
			get_tree().reload_current_scene()
			get_tree().paused = false
			set_process_input(false)
			
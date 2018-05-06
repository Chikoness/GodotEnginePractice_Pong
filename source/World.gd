extends Node

signal score_text_set(score)

var current_score = 0

func _on_Ball_score_added(score):
	current_score += score
	emit_signal("score_text_set", str(current_score))

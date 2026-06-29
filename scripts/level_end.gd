extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	global.current_level += 1
	get_tree().change_scene_to_file("res://scenes/level_" + str(global.current_level) +".tscn")

extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
	Engine.time_scale = 1
	global.shader_mult = 0
	global.current_level += 1
	global.hc_adr = 0
	global.hc_coffee = 0 
	get_tree().change_scene_to_file("res://scenes/level_" + str(global.current_level) +".tscn")

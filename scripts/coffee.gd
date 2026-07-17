extends Area2D



func _on_body_entered(_body: Node2D) -> void:
	global.hc_coffee += 1
	queue_free()
	if get_tree().current_scene.scene_file_path == "res://scenes/level_1.tscn":
		$"../../Text/Label2".queue_free()

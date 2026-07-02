extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	global.hc_adr += 10
	queue_free()

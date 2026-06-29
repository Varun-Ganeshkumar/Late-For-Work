extends Area2D

@onready var label = $CanvasLayer/Label

func _on_body_entered(_body: Node2D) -> void:
	global.hc_coffee += 1
	queue_free()

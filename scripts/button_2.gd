extends Button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.lives == 0:
		self.visible = true
	else:
		self.visible = false
	
func _on_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 
	global.lives = 3
	global.musicPlaying = true
	global.rareDeath = false
	global.current_level = 1

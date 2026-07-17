extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(_body: Node2D) -> void:
	global.lives -= 1
	if global.lives != 0 && global.rareDeath == false:
		timer.start()
		$CanvasLayer/ColorRect.visible = true
		global.restart = true
		global.musicPlaying = false
	if global.lives == 0 || global.rareDeath == true:
		thisIsATest()
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	if global.lives != 0:
		$CanvasLayer/ColorRect.visible = false
		global.musicPlaying = true
func _process(_delta: float) -> void:
	if global.rareDeath:
		thisIsATest()
func thisIsATest() -> void:
	global.lives = 0
	$CanvasLayer/ColorRect.visible = true
	$CanvasLayer/Button.visible = true
	global.restart = false
	global.musicPlaying = false

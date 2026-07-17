extends AudioStreamPlayer

var playingRN = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.musicPlaying == true && playingRN == true:
		self.stream_paused = false
		playingRN = false
	elif global.musicPlaying == false:
		self.stream_paused = true
		playingRN = true

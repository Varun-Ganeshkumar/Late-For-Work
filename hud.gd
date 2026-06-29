extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Label.text = "ITEMS: \n Coffee: " + str(global.hc_coffee) + "\n Adrenaline: " + str(global.hc_adr)

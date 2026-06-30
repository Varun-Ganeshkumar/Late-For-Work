extends Control

@onready var border = $CanvasLayer/ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Label.text = "ITEMS: \n Coffee: " + str(global.hc_coffee) + "\n Adrenaline: " + str(global.hc_adr);
	border.material.set_shader_parameter('alpha', abs(global.shader_mult));
	
	var color_change = 1.00
	
	if global.shader_mult < 0:
		color_change = 1.00
		border.material.set_shader_parameter("standard" , color_change);
	elif global.shader_mult > 1:
		color_change = 1.00
		while color_change > 0:
			await get_tree().create_timer(1).timeout
			color_change = color_change - 0.01
			border.material.set_shader_parameter("standard" , color_change);

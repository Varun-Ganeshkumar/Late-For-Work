extends Control

@onready var border = $CanvasLayer/ColorRect
var color_change = 1.00
var intensityHere = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	%Label.text = "ITEMS: \n Coffee: " + str(global.hc_coffee) + "\n Adrenaline: " + str(global.hc_adr);
	border.material.set_shader_parameter('alpha', intensityHere * abs(global.shader_mult));
# IF COLOR CHANGE IS 1, THAT MEANS IT WILL TURN WHITE
	if global.shader_mult > 0:
		color_change = 0.00
		intensityHere = 2
		border.material.set_shader_parameter("standard" , color_change);
	if global.shader_mult < 0:
		_colorTransition()
		intensityHere = 1
	if global.lives == 2:
		$CanvasLayer/Sprite2D3.hide()
	if global.lives == 1:
		$CanvasLayer/Sprite2D2.hide()
		$CanvasLayer/Sprite2D3.hide()
			
			
func _colorTransition() -> void:
	while color_change < 1:
		await get_tree().create_timer(0.1).timeout
		color_change = color_change + 0.01
		border.material.set_shader_parameter("standard" , color_change);

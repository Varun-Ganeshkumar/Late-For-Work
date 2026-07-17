extends OptionButton


func _on_item_selected(index: int) -> void:
	if self.get_item_text(index) == "Easy Mode":
		global.easyMode = 0.009

	if self.get_item_text(index) == "Normal Mode":
		global.easyMode = 0.012
	$"../StartButton".visible = true
		

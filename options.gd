extends Control


func _on_btn_fullscreen_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_btn_windowed_pressed():
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

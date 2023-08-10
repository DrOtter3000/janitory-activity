extends Control


func _on_feel_yourself_timer_timeout():
	get_tree().change_scene_to_file("res://menu.tscn")

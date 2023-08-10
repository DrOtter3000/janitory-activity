extends Control


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_btn_play_pressed():
	get_tree().change_scene_to_file("res://advice.tscn")
	Gamemanager.doors_open = 0
	Gamemanager.lights_deactivated = false
	Gamemanager.number_of_lights = 0
	Gamemanager.flashlight_status = 2.0

	Gamemanager.haunting = false
	Gamemanager.goob_counter = 0
	Gamemanager.goobs_on_field = 0
	Gamemanager.winable = false

func _on_btn_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

extends Node3D


var reachable = false


func _input(event):
	if event.is_action_pressed("interact") and reachable:
		get_tree().change_scene_to_file("res://winner_screen.tscn")


func _on_winarea_body_entered(body):
	if body.is_in_group("Player"):
		if Gamemanager.winable:
			reachable = true
			get_tree().call_group("GUI", "update_action", "(E) Leave Area")
		else:
			get_tree().call_group("GUI", "update_action", "You can't leave, you have a job to do!")
			

func _on_winarea_body_exited(body):
	if body.is_in_group("Player"):
		reachable = false
		get_tree().call_group("GUI", "update_action", "")

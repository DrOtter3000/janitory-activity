extends Area3D


var ready_to_click = false
@export var lightgroup: String


func _input(event):
	if event.is_action_pressed("interact") and ready_to_click:
		get_tree().call_group(lightgroup, "switch")
		$AudioStreamPlayer.play()
		Gamemanager.lights_deactivated = true


func _on_body_entered(body):
	if body.is_in_group("Player"):
		ready_to_click = true
		get_tree().call_group("GUI", "update_action", "(E) Use Switch")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		ready_to_click = false
		get_tree().call_group("GUI", "update_action", "")

extends Node3D


var grabable = false
var collected = false

func _ready():
	Gamemanager.goobs_on_field += 1


func _process(delta):
	rotate_y(0.5 * delta)


func _input(event):
	if grabable and event.is_action_pressed("interact"):
		Gamemanager.goob_counter += 1
		collected = true
		$Fläche.visible = false
		if Gamemanager.haunting == false:
			get_tree().call_group("Enemy", "start_haunting")
		Gamemanager.haunting = true
		get_tree().call_group("GUI", "update_goobs")
		get_tree().call_group("GUI", "update_action", "")
		$AudioStreamPlayer.play()


func _on_grab_area_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().call_group("GUI", "update_action", "(E) Grab Goob")
		grabable = true


func _on_grab_area_body_exited(body):
	if body.is_in_group("Player"):
		get_tree().call_group("GUI", "update_action", "")
		grabable = false


func _on_audio_stream_player_finished():
	queue_free()

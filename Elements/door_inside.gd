extends Area3D

var door_in_range = false
@export var door_is_ready = true
@export var door_is_closed = true


func _ready():
	door_is_ready = true


func _input(event):
	if event.is_action_pressed("interact"):
		if door_in_range:
			if door_is_ready:
				if door_is_closed:
					$AnimationPlayer.play("open")
					Gamemanager.doors_open += 1
				if door_is_closed == false:
					$AnimationPlayer.play("close")
					Gamemanager.doors_open -= 1


func _on_body_entered(body):
	if body.is_in_group("Player"):
		door_in_range = true
		get_tree().call_group("GUI", "update_action", "(E) Use Door")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		door_in_range = false
		get_tree().call_group("GUI", "update_action", "")

extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$ShakyTimer.wait_time = randf_range(0.01, 0.05)


func _on_shaky_timer_timeout():
	$ShakyTimer.wait_time = randf_range(0.01, 0.05)
	$Enemy.position.x = randf_range(-0.01, 0.01)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://menu.tscn")


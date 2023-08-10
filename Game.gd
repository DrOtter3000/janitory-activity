extends Node3D


func _process(delta):
	if Gamemanager.haunt_level >= 10 and Gamemanager.enemy_move == true:
		get_tree().get_first_node_in_group("Enemy").teleport()
	if Input.is_action_just_pressed("Testspawn"):
		get_tree().get_first_node_in_group("Enemy").teleport()

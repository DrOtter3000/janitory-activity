extends Node3D


@export var new_goob : PackedScene
@export var number_of_goobs_on_map = 7
@onready var possible_spawn_points = $SpawnPoints/GoobSpawnPoints.get_children()


func _ready():
	Gamemanager.flashlight_status = 2
	get_tree().call_group("GUI", "update_lights")
	add_goobs_to_map()
	get_tree().call_group("GUI", "update_goobs")


func _process(delta):
	if Gamemanager.lights_deactivated == true:
		if Gamemanager.haunting == false:
			$Enemy.global_position.x += 3
		Gamemanager.haunting = true

	check_for_winning_conditions()


func add_goobs_to_map():
	for goob in number_of_goobs_on_map:
		randomize()
		var spawn_point = possible_spawn_points[randi() % possible_spawn_points.size()]
		var goober = new_goob.instantiate()
		add_child(goober)
		goober.global_position = spawn_point.position
		possible_spawn_points.erase(spawn_point)
		


func check_for_winning_conditions():
	if Gamemanager.goobs_on_field == Gamemanager.goob_counter and Gamemanager.number_of_lights == 0 and Gamemanager.doors_open == 0:
		Gamemanager.winable = true

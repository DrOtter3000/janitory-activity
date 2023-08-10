extends Node3D


var defect = false
var on = true
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	check_if_defect()
	if defect: 
		$FlickerTimer.start()
	Gamemanager.number_of_lights += 1

func switch():
	if on:
		$FlickerTimer.stop()
		on = false
		$OmniLight3D.light_energy = 0
		Gamemanager.number_of_lights -= 1
	else:
		on = true
		start_light()
		Gamemanager.number_of_lights += 1


func start_light():
	if defect:
		$FlickerTimer.start()
	else:
		$OmniLight3D.light_energy = 1


func check_if_defect():
	if randi() % 15 == 1:
		defect = true

func _on_flicker_timer_timeout():
	if $OmniLight3D.light_energy < 1:
		$OmniLight3D.light_energy = 1
		$FlickerTimer.start()
	else:
		$OmniLight3D.light_energy = randf_range(0.01, 0.5)
		$FlickerTimer.wait_time = randf_range(0.1, 1)
		$FlickerTimer.start()

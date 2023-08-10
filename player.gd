extends CharacterBody3D


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 5
var mouse_sensitivity = 0.002
var flashlight_on = false
var concrete = false
var gravel = false
@onready var floor_detection = $FloorDetectionRayCast
var terrain = "Grass"
var sound_finished = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _process(delta):
	if floor_detection.is_colliding():
		var walkingTerrain = floor_detection.get_collider().get_parent()
		if walkingTerrain != null and walkingTerrain.get_groups().size() > 0:
			terrain = walkingTerrain.get_groups()[0]
	
	walking_sounds()


func _physics_process(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed

	check_flashlight()
	
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed


func walking_sounds():
	
	if is_on_floor():
		if int(velocity.x) != 0 or int(velocity.z) != 0:
			if sound_finished:
				$WalkingSoundSFX.pitch_scale = randf_range(0.8, 1.2)
				if terrain == "Concrete":
					$WalkingSoundSFX.volume_db = 0
					$WalkingSoundSFX.stream = load("res://SFX/ConcreteWalk.wav")
					$WalkingSoundSFX.play()
					sound_finished = false
				elif terrain == "Grass":
					$WalkingSoundSFX.volume_db = -30
					$WalkingSoundSFX.stream = load("res://SFX/GrassWalk.wav")
					$WalkingSoundSFX.play()
					sound_finished = false


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(60), deg_to_rad(65))


func check_flashlight():
	if Input.is_action_just_pressed("flashlight"):
		$FlashlightSFX.play()

		if flashlight_on:
			$Camera3D/SpotLight3D.light_energy = 0
			$LightTimer.stop()
			flashlight_on = false
		else:
			$Camera3D/SpotLight3D.light_energy = Gamemanager.flashlight_status
			$LightTimer.start()
			flashlight_on = true


func _on_light_timer_timeout():
	Gamemanager.flashlight_status *= 0.95
	$Camera3D/SpotLight3D.light_energy = Gamemanager.flashlight_status





func _on_audio_stream_player_3d_finished():
	sound_finished = true

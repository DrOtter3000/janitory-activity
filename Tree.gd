extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var top_radius = randf_range(1, 3)
	$Treetop.scale.x = top_radius
	$Treetop.scale.z = top_radius
	$Treetop.scale.y = randf_range(1, 2)


# Called every frame. 'delta' is tpass # Replace with function body.he elapsed time since the previous frame.
func _process(delta):
	pass

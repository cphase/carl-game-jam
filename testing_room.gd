extends Node3D

var orange_scene = preload("res://orange.tscn")
@export var direction_variance = 5.0
@export var min_strength = 2.5
@export var max_strength = 9
var strength_range = max_strength - min_strength
var frame_counter = 0

func spawn_orange():
	var orange = orange_scene.instantiate()
	orange.position.y = 1 
	orange.position.z = 10
	orange.mass = 6
	orange.add_to_group("fruit")
	add_child(orange)
	throw_orange(orange)
	pass
	
func throw_orange(orange):
	var current_direction = (randf() * direction_variance) - (direction_variance / 2)
	var strength = min_strength + (randf() * strength_range)
	orange.apply_central_impulse(Vector3(current_direction, 1 * strength, -strength))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frame_counter += 1
	if frame_counter >= 10:
		spawn_orange()
		frame_counter = 0
	pass

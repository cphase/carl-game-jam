extends CharacterBody3D

@export var speed = .5
@export var direction_variance = 10.0
@export var direction_time = 1.5
var frame_counter = 59
var current_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frame_counter += 1
	if frame_counter == 60 * direction_time:
		frame_counter = 0
		current_direction = (randf() * direction_variance) - (direction_variance / 2)
	 
	velocity = Vector3(0, 0, 0)
	velocity.x = current_direction * 60 * delta
	velocity.z = speed * 60 * delta
	
	#print(velocity.z)
	move_and_slide()
	#move_and_collide(Vector3(0, 0, speed *.05 * 60 * delta))
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "orange":
			print("picking up orange")
			#collision.get_collider().

extends RigidBody3D

var started_falling = false
var started_slowing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if linear_velocity.length() > .5:
		$CollisionShape3D/AnimatedSprite3D.play("spin")
	elif linear_velocity.length() > 0.005:
		$CollisionShape3D/AnimatedSprite3D.play("slow_spin")
	else:
		$CollisionShape3D/AnimatedSprite3D.pause()
	#if linear_velocity.y < -0.5:
		#started_falling = true
		#
	#if started_falling and not started_slowing and linear_velocity.y >= 0:
		#started_slowing = true
		#$CollisionShape3D/AnimatedSprite3D.play("slow_spin")
		#
	#if started_slowing:
		#if linear_velocity.length() > .05:
			#$CollisionShape3D/AnimatedSprite3D.play()
		#else:
			#$CollisionShape3D/AnimatedSprite3D.pause()

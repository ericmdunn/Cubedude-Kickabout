extends KinematicBody


var motion = Vector3()


export var player_id = 1
const SPEED = 10
const UP = Vector3(0, 1, 0)


func _physics_process(delta):
	move()
	animate()
	face_forward()


# Handles taking in input from the players, calculating movement, and outputting movement to move_and_slide()
func move():
	# Handles analog input from control sticks, as well as stopping when both oposite directions are held on KB
	var x = Input.get_action_strength("right_%s" % player_id) - Input.get_action_strength("left_%s" % player_id)
	var z = Input.get_action_strength("down_%s" % player_id) - Input.get_action_strength("up_%s" % player_id)
	motion = Vector3(x, 0, z)
	move_and_slide(motion * SPEED, UP)


func animate():
	# Animates player movement when moving and stops it wen not
	if motion.length() > 0:
		$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()


func face_forward():
	# Makes the player face the direction they're moving in.
	# Vector3 is multiplied by SPEED to prevent the look direction from lagging behind motion.
	if motion.length() > 0:
		look_at(Vector3(-motion.x, 0, -motion.z)*SPEED, UP)


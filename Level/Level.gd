extends Spatial


# Handles the event when the ball crosses the goal line for either goal
func _on_GoalDetector_body_entered(body, goal_id):
	print("Player #%d has scored!" % goal_id )

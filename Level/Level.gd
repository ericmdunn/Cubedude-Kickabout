extends Spatial


var player_1_score = 0
var player_2_score = 0

const target_score = 3


# Handles the event when the ball crosses the goal line for either goal
func _on_GoalDetector_body_entered(body, goal_id):
	print("Player #%d has scored!" % goal_id )
	get_tree().call_group("game_pieces", "freeze")
	update_score(goal_id)
	$Airhorn.play()
	$Timer.start()


func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")


func update_score(player):
	var new_score
	
	match player:
		1:
			player_1_score += 1
			new_score = player_1_score
		2:
			player_2_score += 1
			new_score = player_2_score
	
	$GUI.update_score(player, new_score)
	check_game_over(player, new_score)


func check_game_over(player, score):
	if score == target_score:
		$GUI.game_over(player)

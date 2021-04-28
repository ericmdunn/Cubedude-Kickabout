extends DirectionalLight


func _ready():
	reset()


func freeze(id):
	$AnimationPlayer.play("Fade")


func reset():
	$AnimationPlayer.play_backwards("Fade")

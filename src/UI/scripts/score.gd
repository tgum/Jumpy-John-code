extends Label

func _process(delta):
	text = "Score " + str(PlayerData.score)

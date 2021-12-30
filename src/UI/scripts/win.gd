extends Button

func on_button_up():
	get_tree().change_scene("res://src/Levels/Level01.tscn")
	PlayerData.lastScene = load("res://src/Levels/Level01.tscn")
	PlayerData.score = 0

extends Button

func on_button_up():
	get_tree().change_scene_to(PlayerData.lastScene)
	PlayerData.score -= 200
	PlayerData.score = max(PlayerData.score, 0)

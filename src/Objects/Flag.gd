tool
extends Area2D

onready var anim_player = $AnimationPlayer

export var next_scene: PackedScene
var win_scene = preload("res://src/UI/Win.tscn")

func _get_configuration_warning():
	return "The next scene property can't be empty" if not next_scene else ""

func teleport():
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
	if next_scene != win_scene:
		PlayerData.lastScene = next_scene
	PlayerData.score += 250


func _on_body_entered(body):
	teleport()

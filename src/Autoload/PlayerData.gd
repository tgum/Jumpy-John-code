extends Node

signal sceneChanged

var lastScene = preload("res://src/Levels/Level01.tscn") setget set_scene
var score = 0 setget set_score

func set_scene(scene: PackedScene):
	lastScene = scene
	emit_signal("sceneChanged")

func set_score(value):
	score = value

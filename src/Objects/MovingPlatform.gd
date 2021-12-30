extends Node2D

export var IDLE_DURATION = 1.0

export var move_to = Vector2.ZERO
export var speed = 3.0
export var timer_delay = 1

var follow = Vector2.ZERO

onready var platform = $platform
onready var tween = $moveTween
onready var timer = $Timer

var paused = false
var mouse_hover = false

func _ready():
	_init_tween()

func _init_tween():
	var duration = move_to.length() / float(speed * 80)
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION * 2)
	tween.start()

func _physics_process(delta):
	if not paused:
		platform.position = platform.position.linear_interpolate(follow, 0.075)


func _on_Button_button_up():
	paused = true
	tween.stop(self)
	timer.start(timer_delay)

func _on_Timer_timeout():
	paused = false
	var duration = move_to.length() / float(speed * 80)
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION * 2)
	tween.resume(self)

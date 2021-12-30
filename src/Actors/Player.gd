extends Actor


export var stomp_impulse = 1000.0
onready var _sprite = $AnimatedSprite

func _on_enemmyDetector_area_entered(area):
	velocity = calc_stomp_velocity(velocity, stomp_impulse)

func _on_enemmyDetector_body_entered(body):
	queue_free()
	get_tree().change_scene("res://src/UI/Game_over.tscn")


func _physics_process(delta):
	var is_jump_interrupted = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction = get_direction()
	velocity = calc_move_velocity(velocity, direction, speed, is_jump_interrupted)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# Player Animations
	if velocity.x > 0:
		_sprite.flip_h = false
		_sprite.animation = "Walking"
	elif velocity.x < 0:
		_sprite.flip_h = true
		_sprite.animation = "Walking"
	elif velocity.y > 0:
		_sprite.animation = "Falling"
	elif velocity.length() == 0:
		_sprite.animation = "IDLE"

func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

func calc_move_velocity(
		linear_velocity,
		direction,
		speed,
		is_jump_interrupted
	):
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0.0
	return new_velocity

func calc_stomp_velocity(linear_velocity, impulse):
	var new_velocity = linear_velocity
	new_velocity.y = -impulse
	return new_velocity




func _on_spikeDetector_body_entered(body):
	queue_free()
	get_tree().change_scene("res://src/UI/Game_over.tscn")

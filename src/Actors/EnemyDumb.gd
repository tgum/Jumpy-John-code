extends "res://src/Actors/Actor.gd"

var score_value = 100

func _ready():
	velocity.x = -speed.x

func _on_stompDetector_body_entered(body):
	if body.global_position.y > get_node("stompDetector").global_position.y:
		return
	get_node("CollisionShape2D").set_deferred("disabled", true)
	queue_free()
	PlayerData.score += score_value

func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, Vector2.UP).y


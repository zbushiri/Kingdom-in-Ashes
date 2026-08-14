extends CharacterBody2D
@export var speed = 50
@export var patrol_distance = 200
var direction = 1
var start_position = Vector2.ZERO
var is_paused := false

func _ready():
	start_position = global_position

func _physics_process(delta):
	if is_paused:
		velocity.x = 0
		velocity.y += 200 * delta
		move_and_slide()
		return

	velocity.x = speed * direction
	velocity.y += 200 * delta
	move_and_slide()

	if is_on_wall():
		direction *= -1
	if abs(global_position.x - start_position.x) > patrol_distance:
		direction *= -1
	if has_node("Sprite2D"):
		$AnimationPlayer.play("move")
	if has_node("Sprite2D"):
		$Sprite2D.flip_h = (direction < 0)

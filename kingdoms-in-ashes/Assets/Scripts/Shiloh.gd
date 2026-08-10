extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0

func _input(event):
	# Handle jump.
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()

	# Flip sprite based on direction
	if direction == 1:
		sprite.flip_h = false
	elif direction == -1:
		sprite.flip_h = true

	# Play animations based on movement
	if abs(velocity.x) > 0.0:
		animation_player.play("move")
	else:
		animation_player.play("idle")

	# Play jump animation
	if velocity.y < 0.0 or velocity.y > 0.0:
		animation_player.play("jump")

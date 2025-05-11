extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $"Player Sprite"


@export var speed = 300.0
@export var jump_velocity = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction < 0:
			player_sprite.flip_h = true
		else:
			player_sprite.flip_h = false
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if velocity.x >0.01 || velocity.x < -0.01:
		player_sprite.play("walk2")
	else:
		player_sprite.play("default")
	
	print(self.position)
	print(player_sprite.position)


	move_and_slide()

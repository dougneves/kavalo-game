extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("idle")
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.play("air")

	move_and_slide()


func _on_yt_live_chat_yt_live_message_read(text: String, authorId, timestamp):
	print(text)
	if text.begins_with("!pular"):
		velocity.y = JUMP_VELOCITY
		
	if text.begins_with("!esquerda"):
		Input.action_release("ui_right")
		Input.action_press("ui_left")
		
	if text.begins_with("!direita"):
		Input.action_release("ui_left")
		Input.action_press("ui_right")
		

extends CharacterBody2D

@onready var animation_player = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_falling = false
var is_landing = false


func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		animation_player.flip_h = direction < 0 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y <= 0:
			animation_player.play("jump")
		elif velocity.y > 0:
			animation_player.play("fall")
			
		is_falling = true
		is_landing = false
		
	if is_on_floor():
		if is_falling == true:
			is_falling = false
			is_landing = true
			animation_player.play("land")
			animation_player.animation_finished.connect(
				func(): is_landing = false, CONNECT_ONE_SHOT)
		
		if not is_landing:
			if direction:
				animation_player.play("run")
			else:
				animation_player.play("idle")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_landing = false

	move_and_slide()

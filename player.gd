extends CharacterBody2D

@onready var animation_player = $AnimatedSprite2D

const SPEED = 175.0
const JUMP_VELOCITY = -300.0
const COYOTE_DURATION = 0.15

var coyote_time = 0.0

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
		coyote_time -=  delta
		
		velocity += get_gravity() * delta
		if velocity.y <= 0:
			animation_player.play("jump")
		elif velocity.y > 0:
			animation_player.play("fall")
			
		is_falling = true
		is_landing = false
	elif is_on_floor():
		coyote_time = COYOTE_DURATION
		
		if is_falling == true and velocity.y > -0.01: ##check that doesnt work rn lol
			is_falling = false
			is_landing = true
			animation_player.play("land")
			landing_fx()
			animation_player.animation_finished.connect(
				func(): is_landing = false, CONNECT_ONE_SHOT)
		
		if not is_landing:
			if direction:
				animation_player.play("run")
			else:
				animation_player.play("idle")

	if Input.is_action_just_pressed("jump") and coyote_time > 0.0:
		velocity.y = JUMP_VELOCITY
		is_landing = false
		coyote_time = 0.0
	
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= 0.25

	move_and_slide()
	
func death():
	set_physics_process(false)
	
	$CollisionShape2D.set_deferred("disabled", true)
	
	animation_player.play("death")
	await animation_player.animation_finished


const LANDING_SCENE = preload("res://landing_fx.tscn")
func landing_fx():
	var landing = LANDING_SCENE.instantiate()
	landing.process_mode = PROCESS_MODE_ALWAYS
	
	landing.global_position.x = self.global_position.x
	landing.global_position.y = self.global_position.y + 8
	
	get_tree().current_scene.add_child(landing)

extends Area2D


@onready var anim_player = $AnimatedSprite2D
var activated = false

func _on_body_entered(body):
	if !activated:
		anim_player.play("get")
		await anim_player.animation_finished
		anim_player.play("get_idle")
		activated = true

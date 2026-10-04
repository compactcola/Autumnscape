extends Area2D

@onready var anim_player = $AnimatedSprite2D

func _on_body_entered(body):
	anim_player.play("opened")
	await anim_player.animation_finished
	anim_player.play("looted")
	await anim_player.animation_finished
	anim_player.play("opened_idle")

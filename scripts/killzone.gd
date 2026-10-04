extends Area2D
@onready var timer = $Timer

func _on_body_entered(body):
	print ("You straight up died")
	body.death()
	
	timer.start()

func _on_timer_timeout():
	print("Timers done bro")
	get_tree().reload_current_scene()

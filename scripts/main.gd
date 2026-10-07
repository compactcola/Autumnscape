extends Node2D

@onready var pause_menu = $PauseMenu


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	
func toggle_pause():
	pause_menu.visible = !pause_menu.visible

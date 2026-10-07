extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed():
	## save game here
	get_tree().quit()



func _on_options_pressed():
	$OptionsMenu.show()

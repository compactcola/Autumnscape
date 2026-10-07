extends Control

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		self.visible = false

func _on_button_pressed():
	self.visible = false

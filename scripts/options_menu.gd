extends Control


@onready var volume_slider = $CenterContainer/VBoxContainer/VolumeBox/VBoxContainer/HSlider
var master_bus_index: int

func _ready() -> void:
	master_bus_index = AudioServer.get_bus_index("Master")
	
	var current_db = AudioServer.get_bus_volume_db(master_bus_index)
	volume_slider.value = db_to_linear(current_db)

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		self.visible = false

func _on_h_slider_value_changed(value):
	_on_value_changed(value)
	
func _on_value_changed(new_value: float) -> void:
	var db_value = linear_to_db(new_value)
	
	AudioServer.set_bus_volume_db(master_bus_index, db_value)
	
	if new_value == 0:
		AudioServer.set_bus_mute(master_bus_index, true)
	else:
		AudioServer.set_bus_mute(master_bus_index, false)




func _on_back_pressed():
	self.visible = false




func _on_control_map_pressed():
	$InputRemapMenu.show()

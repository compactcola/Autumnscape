extends Button
class_name InputRemapButton

@export var action: String
@export var action_event_index: int = 0


func _ready():
	toggle_mode = true
	toggled.connect(_toggled)
	_update_button_text()


func _toggled(toggled_on: bool):
	if not action or not InputMap.has_action(action):
		return

	if toggled_on:
		text = "Awaiting Input!"
		return

	_update_button_text()


func _update_button_text():
	if not action or not InputMap.has_action(action):
		text = "Unassigned!"
		return

	var action_events := InputMap.action_get_events(action)

	if action_event_index >= action_events.size():
		text = "Unassigned!"
		return

	var input := action_events[action_event_index]

	if input is InputEventKey:
		if input.physical_keycode != 0:
			text = OS.get_keycode_string(input.physical_keycode)
		else:
			text = OS.get_keycode_string(input.keycode)
	else:
		text = "Unsupported"


func _input(event: InputEvent):
	if not is_pressed():
		return

	if event is InputEventKey and event.pressed:
		_remap_input(event)
		get_viewport().set_input_as_handled()


func _remap_input(event: InputEventKey):
	var action_events := InputMap.action_get_events(action)

	if action_event_index < action_events.size():
		InputMap.action_erase_event(
			action,
			action_events[action_event_index]
		)

	InputMap.action_add_event(action, event)

	action_event_index = InputMap.action_get_events(action).size() - 1

	button_pressed = false
	release_focus()

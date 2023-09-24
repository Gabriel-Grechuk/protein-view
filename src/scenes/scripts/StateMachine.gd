extends Node

@onready var menu := get_node('/root/Main/MainUI')

var paused = false

func pause():
	paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	menu.show()

func unpause():
	paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	menu.hide()

func isPaused():
	return paused


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed('ui_cancel'):
		if paused:
			unpause()
		else:
			pause()


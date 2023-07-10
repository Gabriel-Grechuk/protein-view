extends Node3D


@onready var menu = $Menu
@onready var userBody = $UserBody

var paused


func pause():
	paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	menu.show()
	

func unpause():
	paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	menu.hide()
	userBody.unpause_routine()


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed('ui_cancel'):
		if paused:
			unpause()
		else:
			pause()


func _ready():
	pause()


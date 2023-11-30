extends Node

@onready var menu := get_node('/root/Main/MainUI')
@onready var loadingScreen := get_node("/root/Main/MainUI/LoadingScreen")

var paused = false
var loading = false

func pause():
	paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	menu.show()

func unpause():
	paused = false
	menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func isPaused():
	return paused

func setLoading():
	loading = true
	loadingScreen.visible = true

func unsetLoading():
	loading = false
	loadingScreen.visible = false

func isLoading():
	return loading

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed('ui_cancel') :
		if paused:
			unpause()
		else:
			pause()
	
	if Input.is_action_just_pressed("lock_mouse"):
		if(not paused):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

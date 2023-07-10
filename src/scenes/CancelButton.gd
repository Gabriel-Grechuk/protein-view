extends Button

@onready var menu := $'../..'

func _pressed():
	menu.hide()

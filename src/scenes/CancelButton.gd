extends Button

@onready var scene := $'../../../'

func _pressed():
	scene.unpause()

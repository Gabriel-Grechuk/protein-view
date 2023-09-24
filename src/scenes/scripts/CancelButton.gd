extends Button

@onready var stateMachine := get_node('/root/Main/StateMachine')

func _pressed():
	stateMachine.unpause()

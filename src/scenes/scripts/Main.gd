extends Node3D

@onready var stateMachine = $StateMachine

func _ready():
	stateMachine.pause()

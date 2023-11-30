extends Control

class_name ParserUI

@export var PDBText: String = ""
@export var SDFText: String = ""

@export var Loading: bool = true

# Text Inputs
@onready var SDFInput := get_node("TabContainer/SDF Input/SDFText")
@onready var PDBInput := get_node("TabContainer/PDB Input/PDBFile")

# Buttons
@onready var LoadSDFTextButton := get_node("TabContainer/SDF Input/LoadSDFButton")
@onready var LoadPDBTextButton := get_node("TabContainer/PDB Input/LoadPDBButton")
@onready var ClearSDFButton := get_node("TabContainer/SDF Input/ClearSDFButton")
@onready var ClearPDBButton := get_node("TabContainer/PDB Input/ClearPDBButton")
@onready var ClosseButton := get_node("ClosseButton")

@onready var StateMachine := get_node("/root/Main/StateMachine")


func _ready():
	LoadSDFTextButton.pressed.connect(self._loadSDFTextInput)
	LoadPDBTextButton.pressed.connect(self._loadPDBTextInput)
	ClearSDFButton.pressed.connect(self._clearSDFTextInput)
	ClearPDBButton.pressed.connect(self._clearPDBTextInput)
	ClosseButton.pressed.connect(self._closeUI)


func _clearPDBTextInput():
	PDBInput.set_text("")

func _clearSDFTextInput():
	SDFInput.set_text("")

func _loadPDBTextInput():
	PDBText = PDBInput.get_text()

func _loadSDFTextInput():
	SDFText = SDFInput.get_text()

func _closeUI():
	StateMachine.unpause()

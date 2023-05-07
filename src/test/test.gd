class_name Test
extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var molecule := Molecule.new(["C", "C", "Cl"], [[1, 2], [2, 3]])
	molecule.debug_print()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

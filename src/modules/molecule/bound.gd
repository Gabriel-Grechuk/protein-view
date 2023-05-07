class_name Bound


var position: Vector3
var angle: Vector2
var radius: float

var atom_1_index: int
var atom_2_index: int


func _init(default_atom_1_index: int = 0,
		default_atom_2_index: int = 0,
		default_radius: int = 0,
		default_position: Vector3 = Vector3(0, 0, 0),
		default_angle: Vector2 = Vector2(0, 0),
		):
	atom_1_index = default_atom_1_index
	atom_2_index = default_atom_2_index
	position = default_position
	angle = default_angle

func debug_print():
	print("-----BOUND-----")
	print("Atom 1: ", atom_1_index)
	print("Atom 2: ", atom_2_index)
	print("Position: ", position)
	print("Angle: ", angle)
	print()


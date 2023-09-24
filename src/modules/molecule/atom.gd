class_name Atom


var index: int

var position: Vector3

var number: int		# Atomic number.
var symbol: String	# Symbol.
var weight: float	# Atomic weight.
var radius: float	# Van der Waals radius.

var ion: int


func _init(_symbol: String, default_ion: int = 0):
	var atomic_number: int = AtomConstants.atomic_number_map[_symbol]
	if not atomic_number:
		push_error("Invalid atomic symbol.")

	number = AtomConstants.atomic_info[atomic_number].number
	symbol = AtomConstants.atomic_info[atomic_number].symbol
	weight = AtomConstants.atomic_info[atomic_number].weight
	radius = AtomConstants.atomic_info[atomic_number].radius
	position = Vector3(0, 0, 0)
	ion = default_ion
	

func debug_print():
	print("-----ATOM-----")
	print("Atom: ", index)
	print("Position: ", position)
	print("Atomic number: ", number)
	print("Symbol: ", symbol)
	print("Weight: ", weight)
	print("Radius: ", radius)
	print()

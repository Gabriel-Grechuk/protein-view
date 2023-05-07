class_name Atom


var index: int

var position: Vector3

var number: int		# Atomic number.
var symbol: String	# Symbol.
var weight: float	# Atomic weight.
var radius: float	# Van der Waals radius.


func _init(default_number: int = 0,
		default_symbol: String = "",
		default_weight: float = 0,
		default_radius: float = 0,
		defautl_position: Vector3 = Vector3(0, 0, 0)):
	number = default_number
	symbol = default_symbol
	weight = default_weight
	radius = default_radius
	position = default_position

func debug_print():
	print("-----ATOM-----")
	print("Atom: ", index)
	print("Position: ", position)
	print("Atomic number: ", number)
	print("Symbol: ", symbol)
	print("Weight: ", weight)
	print("Radius: ", radius)
	print()


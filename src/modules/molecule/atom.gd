class_name Atom


var number: int		# Atomic number.
var symbol: String	# Symbol.
var weight: float	# Atomic weight.
var radius: float	# Van der Waals radius.


func _init(default_number: int = 0,
		default_symbol: String = "",
		default_weight: float = 0,
		default_radius: float = 0):
	number = default_number
	symbol = default_symbol
	weight = default_weight
	radius = default_radius


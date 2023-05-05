class_name Atom


var number: int
var symbol: String
var weight: float
var radius: int # In picometers.


func _init(default_number: int = 0,
		default_symbol: String = "",
		default_weight: float = 0,
		default_radius: int = 0):
	number = default_number
	symbol = default_symbol
	weight = default_weight
	radius = default_radius


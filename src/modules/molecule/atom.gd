class_name Atom


var index: int

var position: Vector3

var number: int		# Atomic number.
var symbol: String	# Symbol.
var weight: float	# Atomic weight.
var radius: float	# Van der Waals radius.
var electronic_configuration: Dictionary


func _init(_symbol: String):
	var atomic_number: int = AtomConstants.atomic_number_map[_symbol]
	if not atomic_number:
		push_error("Invalid atomic symbol.")

	number = AtomConstants.atomic_info[atomic_number].number
	symbol = AtomConstants.atomic_info[atomic_number].symbol
	weight = AtomConstants.atomic_info[atomic_number].weight
	radius = AtomConstants.atomic_info[atomic_number].radius
	position = Vector3(0, 0, 0)

	_gen_electronic_configuration()


func _gen_electronic_configuration():
	var counter = 0
	var shell_count = 0
	var electron_count = 0

	while electron_count < number:
		var shell = {}
		shell['s'] = min(2, number - electron_count)
		electron_count += shell['s']
		if electron_count >= number:
			electronic_configuration[shell_count] = shell
			break
		shell['p'] = min(6, number - electron_count)
		electron_count += shell['p']
		if electron_count >= number:
			electronic_configuration[shell_count] = shell
			break
		shell['d'] = min(10, number - electron_count)
		electron_count += shell['d']
		if electron_count >= number:
			electronic_configuration[shell_count] = shell
			break
		shell['f'] = min(14, number - electron_count)
		electron_count += shell['f']
		electronic_configuration[shell_count] = shell
		shell_count += 1

func debug_print():
	print("-----ATOM-----")
	print("Atom: ", index)
	print("Position: ", position)
	print("Atomic number: ", number)
	print("Symbol: ", symbol)
	print("Weight: ", weight)
	print("Radius: ", radius)
	print("Electronic Configuration: ", electronic_configuration)
	print()

class_name Molecule


var atoms: Array[Atom]
var bounds: Array[Bound]


func _init(symbols: Array[String] = [],
		bound_indexes: Array = []):
	_gen_atom_array(symbols)
	_gen_bound_array(bound_indexes)

func _gen_atom_array(symbols: Array[String]):
	for i in symbols.size():
		var _atom = AtomConstants.get_atom(symbols[i])
		_atom.index = i + 1
		atoms.push_back(_atom)

func _gen_bound_array(indexes: Array):
	for index in indexes:
		bounds.push_back(Bound.new(index[0], index[1]))

func debug_print():
	print("-----MOLECULE-----")
	for atom in atoms:
		atom.debug_print()
	for bound in bounds:
		bound.debug_print()
	print()

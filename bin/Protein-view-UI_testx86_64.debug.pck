GDPC                 �                                                                         T   res://.godot/exported/133200997/export-420939f14319fe2b92e31e62f5a099fd-ParserUI.scn�<      j      PqF��&|[c]n����    X   res://.godot/exported/133200997/export-b98d215325b3a3164f794acf77d114c1-DefaultView.scn  :      �      �ۤ�C���q�F    ,   res://.godot/global_script_class_cache.cfg          -      �YG�$Q���t�/��    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex`D      \      6(4�d=EQ�ǮVj,       res://.godot/uid_cache.bin  �c      u       ��n{�X̌R�޲"i       res://icon.svg  pS      N      ]��s�9^w/�����       res://icon.svg.import   �Q      �       �-��iT4	�I4!��       res://project.binary@d      �      �6���?����F�A�    $   res://src/modules/molecule/atom.gd  0      �       ��M�L�w��R�rB    ,   res://src/modules/molecule/atom_constants.gd0
      �*      ��^�9 $aEKc�t6|    $   res://src/modules/molecule/bound.gd �4      s      �Ǻ�6rD��<��4    (   res://src/modules/molecule/molecule.gd  @7      f      ܁�SXߧ��� �[    $   res://src/modules/parsers/smiles.gd �9      N       ��[1�+ҁ�s�V �    (   res://src/scenes/DefaultView.tscn.remap �R      h       Q��5� ~�_�<3Z��    $   res://src/scenes/ParserUI.tscn.remap S      e       L��L�/<���uq�;�       res://src/test/test.gd   C      3      �N����7�O�\�V    ����list=Array[Dictionary]([{
"base": &"RefCounted",
"class": &"Atom",
"icon": "",
"language": &"GDScript",
"path": "res://src/modules/molecule/atom.gd"
}, {
"base": &"RefCounted",
"class": &"AtomConstants",
"icon": "",
"language": &"GDScript",
"path": "res://src/modules/molecule/atom_constants.gd"
}, {
"base": &"RefCounted",
"class": &"Bound",
"icon": "",
"language": &"GDScript",
"path": "res://src/modules/molecule/bound.gd"
}, {
"base": &"RefCounted",
"class": &"Molecule",
"icon": "",
"language": &"GDScript",
"path": "res://src/modules/molecule/molecule.gd"
}, {
"base": &"RefCounted",
"class": &"SmilesParser",
"icon": "",
"language": &"GDScript",
"path": "res://src/modules/parsers/smiles.gd"
}, {
"base": &"Node",
"class": &"Test",
"icon": "",
"language": &"GDScript",
"path": "res://src/test/test.gd"
}])
���class_name Atom


var index: int

var position: Vector3

var number: int		# Atomic number.
var symbol: String	# Symbol.
var weight: float	# Atomic weight.
var radius: float	# Van der Waals radius.
var electronic_configuration: Dictionary


func _init(symbol: String):
	var atomic_number: int = AtomConstants.atomic_number_map[symbol]
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
�d:J��Yk+�class_name AtomConstants


const atomic_info = {
	1: {
		number = 1, 		# Atomic number.
		symbol = "H",		# Symbol.
		weight = 1.008,		# Atomic weight.
		radius = 1.1,		# Van der Waals radius.
	},

	2: {
		number = 2,
		symbol = "He",
		weight = 4.003,
		radius = 1.4,
	},

	3: {
		number = 3,
		symbol = "Li",
		weight = 6.941,
		radius = 1.81,
	},

	4: {
		number = 4,
		symbol = "Be",
		weight = 9.012,
		radius = 1.53,
	},

	5: {
		number = 5,
		symbol = "B",
		weight = 10.811,
		radius = 1.92,
	},

	6: {
		number = 6,
		symbol = "C",
		weight = 12.011,
		radius = 1.7,
	},

	7: {
		number = 7,
		symbol = "N",
		weight = 14.007,
		radius = 1.55,
	},

	8: {
		number = 8,
		symbol = "O",
		weight = 15.999,
		radius = 1.52,
	},

	9: {
		number = 9,
		symbol = "F",
		weight = 18.998,
		radius = 1.47,
	},

	10: {
		number = 10,
		symbol = "Ne",
		weight = 20.18,
		radius = 1.54,
	},

	11: {
		number = 11,
		symbol = "Na",
		weight = 22.99,
		radius = 2.27,
	},

	12: {
		number = 12,
		symbol = "Mg",
		weight = 24.305,
		radius = 1.73,
	},

	13: {
		number = 13,
		symbol = "Al",
		weight = 26.982,
		radius = 1.84,
	},

	14: {
		number = 14,
		symbol = "Si",
		weight = 28.086,
		radius = 2.1,
	},

	15: {
		number = 15,
		symbol = "P",
		weight = 30.974,
		radius = 1.8,
	},

	16: {
		number = 16,
		symbol = "S",
		weight = 32.065,
		radius = 1.8,
	},

	17: {
		number = 17,
		symbol = "Cl",
		weight = 35.453,
		radius = 1.75,
	},

	18: {
		number = 18,
		symbol = "Ar",
		weight = 39.948,
		radius = 1.88,
	},

	19: {
		number = 19,
		symbol = "K",
		weight = 39.098,
		radius = 2.75,
	},

	20: {
		number = 20,
		symbol = "Ca",
		weight = 40.078,
		radius = 2.31,
	},

	21: {
		number = 21,
		symbol = "Sc",
		weight = 44.956,
		radius = 2.3,
	},

	22: {
		number = 22,
		symbol = "Ti",
		weight = 47.867,
		radius = 2.15,
	},

	23: {
		number = 23,
		symbol = "V",
		weight = 50.942,
		radius = 2.05,
	},

	24: {
		number = 24,
		symbol = "Cr",
		weight = 51.996,
		radius = 2.05,
	},

	25: {
		number = 25,
		symbol = "Mn",
		weight = 54.938,
		radius = 2.05,
	},

	26: {
		number = 26,
		symbol = "Fe",
		weight = 55.845,
		radius = 2.05,
	},

	27: {
		number = 27,
		symbol = "Co",
		weight = 58.933,
		radius = 2.0,
	},

	28: {
		number = 28,
		symbol = "Ni",
		weight = 58.693,
		radius = 2.0,
	},

	29: {
		number = 29,
		symbol = "Cu",
		weight = 63.546,
		radius = 2.0,
	},

	30: {
		number = 30,
		symbol = "Zn",
		weight = 65.409,
		radius = 2.1,
	},

	31: {
		number = 31,
		symbol = "Ga",
		weight = 69.723,
		radius = 1.87,
	},

	32: {
		number = 32,
		symbol = "Ge",
		weight = 72.64,
		radius = 2.11,
	},

	33: {
		number = 33,
		symbol = "As",
		weight = 74.922,
		radius = 1.85,
	},

	34: {
		number = 34,
		symbol = "Se",
		weight = 78.96,
		radius = 1.9,
	},

	35: {
		number = 35,
		symbol = "Br",
		weight = 79.904,
		radius = 1.83,
	},

	36: {
		number = 36,
		symbol = "Kr",
		weight = 83.798,
		radius = 2.02,
	},

	37: {
		number = 37,
		symbol = "Rb",
		weight = 85.468,
		radius = 3.03,
	},

	38: {
		number = 38,
		symbol = "Sr",
		weight = 87.62,
		radius = 2.49,
	},

	39: {
		number = 39,
		symbol = "Y",
		weight = 88.906,
		radius = 2.4,
	},

	40: {
		number = 40,
		symbol = "Zr",
		weight = 91.224,
		radius = 2.3,
	},

	41: {
		number = 41,
		symbol = "Nb",
		weight = 92.906,
		radius = 2.15,
	},

	42: {
		number = 42,
		symbol = "Mo",
		weight = 95.94,
		radius = 2.1,
	},

	43: {
		number = 43,
		symbol = "Tc",
		weight = 98,
		radius = 2.05,
	},

	44: {
		number = 44,
		symbol = "Ru",
		weight = 101.07,
		radius = 2.05,
	},

	45: {
		number = 45,
		symbol = "Rh",
		weight = 102.905,
		radius = 2.0,
	},

	46: {
		number = 46,
		symbol = "Pd",
		weight = 106.42,
		radius = 2.05,
	},

	47: {
		number = 47,
		symbol = "Ag",
		weight = 107.868,
		radius = 2.1,
	},

	48: {
		number = 48,
		symbol = "Cd",
		weight = 112.411,
		radius = 2.2,
	},

	49: {
		number = 49,
		symbol = "In",
		weight = 114.818,
		radius = 2.2,
	},

	50: {
		number = 50,
		symbol = "Sn",
		weight = 118.71,
		radius = 1.93,
	},

	51: {
		number = 51,
		symbol = "Sb",
		weight = 121.76,
		radius = 2.17,
	},

	52: {
		number = 52,
		symbol = "Te",
		weight = 127.6,
		radius = 2.06,
	},

	53: {
		number = 53,
		symbol = "I",
		weight = 126.904,
		radius = 1.98,
	},

	54: {
		number = 54,
		symbol = "Xe",
		weight = 131.293,
		radius = 2.16,
	},

	55: {
		number = 55,
		symbol = "Cs",
		weight = 132.905,
		radius = 3.43,
	},

	56: {
		number = 56,
		symbol = "Ba",
		weight = 137.327,
		radius = 2.68,
	},

	57: {
		number = 57,
		symbol = "La",
		weight = 138.905,
		radius = 2.5,
	},

	58: {
		number = 58,
		symbol = "Ce",
		weight = 140.116,
		radius = 2.48,
	},

	59: {
		number = 59,
		symbol = "Pr",
		weight = 140.908,
		radius = 2.47,
	},

	60: {
		number = 60,
		symbol = "Nd",
		weight = 144.242,
		radius = 2.45,
	},

	61: {
		number = 61,
		symbol = "Pm",
		weight = 145,
		radius = 2.43,
	},

	62: {
		number = 62,
		symbol = "Sm",
		weight = 150.36,
		radius = 2.42,
	},

	63: {
		number = 63,
		symbol = "Eu",
		weight = 151.964,
		radius = 2.4,
	},

	64: {
		number = 64,
		symbol = "Gd",
		weight = 157.25,
		radius = 2.38,
	},

	65: {
		number = 65,
		symbol = "Tb",
		weight = 158.925,
		radius = 2.37,
	},

	66: {
		number = 66,
		symbol = "Dy",
		weight = 162.5,
		radius = 2.35,
	},

	67: {
		number = 67,
		symbol = "Ho",
		weight = 164.930,
		radius = 2.33,
	},

	68: {
		number = 68,
		symbol = "Er",
		weight = 167.259,
		radius = 2.32,
	},

	69: {
		number = 69,
		symbol = "Tm",
		weight = 168.934,
		radius = 2.3,
	},

	70: {
		number = 70,
		symbol = "Yb",
		weight = 173.04,
		radius = 2.28,
	},

	71: {
		number = 71,
		symbol = "Lu",
		weight = 174.967,
		radius = 2.27,
	},

	72: {
		number = 72,
		symbol = "Hf",
		weight = 178.49,
		radius = 2.25,
	},

	73: {
		number = 73,
		symbol = "Ta",
		weight = 180.948,
		radius = 2.2,
	},

	74: {
		number = 74,
		symbol = "W",
		weight = 183.84,
		radius = 2.1,
	},

	75: {
		number = 75,
		symbol = "Re",
		weight = 186.207,
		radius = 2.05,
	},

	76: {
		number = 76,
		symbol = "Os",
		weight = 190.23,
		radius = 2.0,
	},

	77: {
		number = 77,
		symbol = "Ir",
		weight = 192.217,
		radius = 2.0,
	},

	78: {
		number = 78,
		symbol = "Pt",
		weight = 195.084,
		radius = 2.05,
	},

	79: {
		number = 79,
		symbol = "Au",
		weight = 196.967,
		radius = 2.1,
	},

	80: {
		number = 80,
		symbol = "Hg",
		weight = 200.59,
		radius = 2.05,
	},

	81: {
		number = 81,
		symbol = "Tl",
		weight = 204.383,
		radius = 1.96,
	},

	82: {
		number = 82,
		symbol = "Pb",
		weight = 207.2,
		radius = 2.02,
	},

	83: {
		number = 83,
		symbol = "Bi",
		weight = 208.98,
		radius = 2.07,
	},

	84: {
		number = 84,
		symbol = "Po",
		weight = 210,
		radius = 1.97,
	},

	85: {
		number = 85,
		symbol = "At",
		weight = 210,
		radius = 2.02,
	},

	86: {
		number = 86,
		symbol = "Rn",
		weight = 220,
		radius = 2.2,
	},

	87: {
		number = 87,
		symbol = "Fr",
		weight = 223,
		radius = 3.48,
	},

	88: {
		number = 88,
		symbol = "Ra",
		weight = 226,
		radius = 2.83,
	},

	89: {
		number = 89,
		symbol = "Ac",
		weight = 227,
		radius = 2.0,
	},

	90: {
		number = 90,
		symbol = "Th",
		weight = 232.03806,
		radius = 2.4,
	},

	91: {
		number = 91,
		symbol = "Pa",
		weight = 231.03588,
		radius = 2.0,
	},

	92: {
		number = 92,
		symbol = "U",
		weight = 238.02891,
		radius = 2.3,
	},

	93: {
		number = 93,
		symbol = "Np",
		weight = 237,
		radius = 2.0,
	},

	94: {
		number = 94,
		symbol = "Pu",
		weight = 244,
		radius = 2.0,
	},

	95: {
		number = 95,
		symbol = "Am",
		weight = 243,
		radius = 2.0,
	},

	96: {
		number = 96,
		symbol = "Cm",
		weight = 247,
		radius = 2.0,
	},

	97: {
		number = 97,
		symbol = "Bk",
		weight = 247,
		radius = 2.0,
	},

	98: {
		number = 98,
		symbol = "Cf",
		weight = 251,
		radius = 2.0,
	},

	99: {
		number = 99,
		symbol = "Es",
		weight = 252,
		radius = 2.0,
	},

	100: {
		number = 100,
		symbol = "Fm",
		weight = 257,
		radius = 2.0,
	},

	101: {
		number = 101,
		symbol = "Md",
		weight = 258,
		radius = 2.0,
	},

	102: {
		number = 102,
		symbol = "No",
		weight = 259,
		radius = 2.0,
	},

	103: {
		number = 103,
		symbol = "Lr",
		weight = 262,
		radius = 2.0,
	},

	104: {
		number = 104,
		symbol = "Rf",
		wheight = 261,
		radius = 2.0,
	},

	105: {
		number = 105,
		symbol = "Db",
		wheight = 262,
		radius = 2.0,
	},

	106: {
		number = 106,
		symbol = "Sg",
		wheight = 266,
		radius = 2.0,
	},

	107: {
		number = 107,
		symbol = "Bh",
		wheight = 264,
		radius = 2.0,
	},

	108: {
		number = 108,
		symbol = "Hs",
		wheight = 277,
		radius = 2.0,
	},

	109: {
		number = 109,
		symbol = "Mt",
		wheight = 268,
		radius = 2.0,
	},

	110: {
		number = 110,
		symbol = "Ds",
		wheight = 271,
		radius = 2.0,
	},

	111: {
		number = 111,
		symbol = "Rg",
		wheight = 272,
		radius = 2.0,
	},

	112: {
		number = 112,
		symbol = "Cn",
		wheight = 277,
		radius = 2.0,
	},

	113: {
		number = 113,
		symbol = "Nh",
		wheight = 286,
		radius = 2.0,
	},

	114: {
		number = 114,
		symbol = "Fl",
		wheight = 289,
		radius = 2.0,
	},

	115: {
		number = 115,
		symbol = "Mc",
		wheight = 288,
		radius = 2.0,
	},

	116: {
		number = 116,
		symbol = "Lv",
		wheight = 293,
		radius = 2.0,
	},

	117: {
		number = 117,
		symbol = "Ts",
		wheight = 294,
		radius = 2.0,
	},

	118: {
		number = 118,
		symbol = "Og",
		wheight = 294,
		radius = 2.0,
	},
}

const atomic_number_map = {
	H  = 1,
	He = 2,
	Li = 3,
	Be = 4,
	B  = 5,
	C  = 6,
	N  = 7,
	O  = 8,
	F  = 9,
	Ne = 10,
	Na = 11,
	Mg = 12,
	Al = 13,
	Si = 14,
	P  = 15,
	S  = 16,
	Cl = 17,
	Ar = 18,
	K  = 19,
	Ca = 20,
	Sc = 21,
	Ti = 22,
	V  = 23,
	Cr = 24,
	Mn = 25,
	Fe = 26,
	Co = 27,
	Ni = 28,
	Cu = 29,
	Zn = 30,
	Ga = 31,
	Ge = 32,
	As = 33,
	Se = 34,
	Br = 35,
	Kr = 36,
	Rb = 37,
	Sr = 38,
	Y  = 39,
	Zr = 40,
	Nb = 41,
	Mo = 42,
	Tc = 43,
	Ru = 44,
	Rh = 45,
	Pd = 46,
	Ag = 47,
	Cd = 48,
	In = 49,
	Sn = 50,
	Sb = 51,
	Te = 52,
	I  = 53,
	Xe = 54,
	Cs = 55,
	Ba = 56,
	La = 57,
	Ce = 58,
	Pr = 59,
	Nd = 60,
	Pm = 61,
	Sm = 62,
	Eu = 63,
	Gd = 64,
	Tb = 65,
	Dy = 66,
	Ho = 67,
	Er = 68,
	Tm = 69,
	Yb = 70,
	Lu = 71,
	Hf = 72,
	Ta = 73,
	W  = 74,
	Re = 75,
	Os = 76,
	Ir = 77,
	Pt = 78,
	Au = 79,
	Hg = 80,
	Tl = 81,
	Pb = 82,
	Bi = 83,
	Po = 84,
	At = 85,
	Rn = 86,
	Fr = 87,
	Ra = 88,
	Ac = 89,
	Th = 90,
	Pa = 91,
	U  = 92,
	Np = 93,
	Pu = 94,
	Am = 95,
	Cm = 96,
	Bk = 97,
	Cf = 98,
	Es = 99,
	Fm = 100,
	Md = 101,
	No = 102,
	Lr = 103,
	Rf = 104,
	Db = 105,
	Sg = 106,
	Bh = 107,
	Hs = 108,
	Mt = 109,
	Ds = 110,
	Rg = 111,
	Cn = 112,
	Nh = 113,
	Fl = 114,
	Mc = 115,
	Lv = 116,
	Ts = 117,
	Og = 118,
}

const electron_energy_levels = {
	_1s = 2,
	_2s = 2,
	_2p = 6,
	_3s = 2,
	_3p = 6,
	_4s = 2,
	_3d = 10,
	_4p = 6,
	_5s = 2,
	_4d = 10,
	_5p = 6,
	_6s = 2,
	_4f = 14,
	_5d = 10,
	_6p = 6,
	_7s = 2,
	_5f = 14,
	_6d = 10,
	_7p = 6,
}
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

�,G=:���H�class_name Molecule


var atoms: Array[Atom]
var bounds: Array[Bound]


func _init(symbols: Array[String] = [],
		bound_indexes: Array = []):
	_gen_atom_array(symbols)
	_gen_bound_array(bound_indexes)

func _gen_atom_array(symbols: Array[String]):
	for i in symbols.size():
		var _atom = Atom.new(symbols[i]);
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
#�s��gj��class_name SmilesParser

static func parse(smiles: String) -> Molecule:
	pass
��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://src/test/test.gd ��������      local://PackedScene_d4xwu          PackedScene          	         names "         DefaultView    Node3D    Test    script    Node    	   variants                       node_count             nodes        ��������       ����                      ����                    conn_count              conns               node_paths              editable_instances              version             RSRCr.cL`9��d�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://src/test/test.gd ��������      local://PackedScene_pgcae          PackedScene          	         names "      	   ParserUI    layout_mode    anchors_preset    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    Control    ResultInput    placeholder_text 	   TextEdit    SmileInput    custom_minimum_size    ParseButton    text    Button    ClearButton    Test    script    Node    	   variants                        �?     ��     h�    ��    ���           �B     C    �D     �C      Result 
     �B  �A     �B     tB    @D     �B      Enter Smile      �C     �B    ��C     C      Parse!            ��C    �D      Clear                 node_count             nodes     r   ��������       ����
                                                    	      
                        ����                  	      
                                 ����                                                               ����                                                         ����                                                         ����                   conn_count              conns               node_paths              editable_instances              version             RSRCR�l1�class_name Test
extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var molecule := Molecule.new(["C", "C", "Cl"], [[1, 2], [2, 3]])
	molecule.debug_print()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
��|
~��E�ki@GST2   �   �      ����               � �        $  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�5��I��'���F�"ɹ{�p����	"+d������M�q��� .^>и��6��a�q��gD�h:L��A�\D�
�\=k�(���_d2W��dV#w�o�	����I]�q5�*$8Ѡ$G9��lH]��c�LX���ZӞ3֌����r�2�2ؽL��d��l��1�.��u�5�!�]2�E��`+�H&�T�D�ި7P��&I�<�ng5�O!��͙������n�
ؚѠ:��W��J�+�����6��ɒ�HD�S�z�����8�&�kF�j7N�;YK�$R�����]�VٶHm���)�rh+���ɮ�d�Q��
����]	SU�9�B��fQm]��~Z�x.�/��2q���R���,snV{�7c,���p�I�kSg�[cNP=��b���74pf��)w<:Ŋ��7j0���{4�R_��K܅1�����<߁����Vs)�j�c8���L�Um% �*m/�*+ �<����S��ɩ��a��?��F�w��"�`���BrV�����4�1�*��F^���IKJg`��MK������!iVem�9�IN3;#cL��n/�i����q+������trʈkJI-����R��H�O�ܕ����2
���1&���v�ֳ+Q4蝁U
���m�c�����v% J!��+��v%�M�Z��ꚺ���0N��Q2�9e�qä�U��ZL��䜁�u_(���I؛j+0Ɩ�Z��}�s*�]���Kܙ����SG��+�3p�Ei�,n&���>lgC���!qյ�(_e����2ic3iڦ�U��j�q�RsUi����)w��Rt�=c,if:2ɛ�1�6I�����^^UVx*e��1�8%��DzR1�R'u]Q�	�rs��]���"���lW���a7]o�����~P���W��lZ�+��>�j^c�+a��4���jDNὗ�-��8'n�?e��hҴ�iA�QH)J�R�D�̰oX?ؿ�i�#�?����g�к�@�e�=C{���&��ށ�+ڕ��|h\��'Ч_G�F��U^u2T��ӁQ%�e|���p ���������k	V����eq3���8 � �K�w|�Ɗ����oz-V���s ����"�H%* �	z��xl�4��u�"�Hk�L��P���i��������0�H!�g�Ɲ&��|bn�������]4�"}�"���9;K���s��"c. 8�6�&��N3R"p�pI}��*G��3@�`��ok}��9?"@<�����sv� ���Ԣ��Q@,�A��P8��2��B��r��X��3�= n$�^ ������<ܽ�r"�1 �^��i��a �(��~dp-V�rB�eB8��]
�p ZA$\3U�~B�O ��;��-|��
{�V��6���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���H�#2:E(*�H���{��>��&!��$| �~�\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j���	P:�a�G0 �J��$�M���@�Q��[z��i��~q�1?�E�p�������7i���<*�,b�е���Z����N-
��>/.�g�'R�e��K�)"}��K�U�ƹ�>��#�rw߶ȑqF�l�Ο�ͧ�e�3�[䴻o�L~���EN�N�U9�������w��G����B���t��~�����qk-ί�#��Ξ����κ���Z��u����;{�ȴ<������N�~���hA+�r ���/����~o�9>3.3�s������}^^�_�����8���S@s%��]K�\�)��B�w�Uc۽��X�ǧ�;M<*)�ȝ&����~$#%�q����������Q�4ytz�S]�Y9���ޡ$-5���.���S_��?�O/���]�7�;��L��Zb�����8���Guo�[''�،E%���;����#Ɲ&f��_1�߃fw�!E�BX���v��+�p�DjG��j�4�G�Wr����� 3�7��� ������(����"=�NY!<l��	mr�՚���Jk�mpga�;��\)6�*k�'b�;	�V^ݨ�mN�f�S���ն�a���ϡq�[f|#U����^����jO/���9͑Z��������.ɫ�/���������I�D��R�8�5��+��H4�N����J��l�'�כ�������H����%"��Z�� ����`"��̃��L���>ij~Z,qWXo�}{�y�i�G���sz�Q�?�����������lZdF?�]FXm�-r�m����Ф:�З���:}|x���>e������{�0���v��Gş�������u{�^��}hR���f�"����2�:=��)�X\[���Ů=�Qg��Y&�q�6-,P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸~��f��i���_�j�S-|��w�R�<Lծd�ٞ,9�8��I�Ү�6 *3�ey�[�Ԗ�k��R���<������
g�R���~��a��
��ʾiI9u����*ۏ�ü�<mԤ���T��Amf�B���ĝq��iS��4��yqm-w�j��̝qc�3�j�˝mqm]P��4���8i�d�u�΄ݿ���X���KG.�?l�<�����!��Z�V�\8��ʡ�@����mK�l���p0/$R�����X�	Z��B�]=Vq �R�bk�U�r�[�� ���d�9-�:g I<2�Oy�k���������H�8����Z�<t��A�i��#�ӧ0"�m�:X�1X���GҖ@n�I�겦�CM��@������G"f���A$�t�oyJ{θxOi�-7�F�n"�eS����=ɞ���A��Aq�V��e����↨�����U3�c�*�*44C��V�:4�ĳ%�xr2V�_)^�a]\dZEZ�C 
�*V#��	NP��\�(�4^sh8T�H��P�_��}��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b6467nat7dbdj"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 %�Z �Xf�f�����[remap]

path="res://.godot/exported/133200997/export-b98d215325b3a3164f794acf77d114c1-DefaultView.scn"
χ���e�*[remap]

path="res://.godot/exported/133200997/export-420939f14319fe2b92e31e62f5a099fd-ParserUI.scn"
���Pp���W�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
�   ��~�T�s!   res://src/scenes/DefaultView.tscnN=��+�#C   res://src/scenes/ParserUI.tscnk�}��	,@   res://icon.svg�a���SS�ECFG      application/config/name         Protein-view   application/run/main_scene(         res://src/scenes/ParserUI.tscn     application/config/features$   "         4.0    Forward Plus       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �  #   display/window/size/viewport_height      	     display/window/size/resizable          �p�P|M9��=�
#!/bin/python3

from enum import Enum

###############################################################################
#
#   Molecule tree implementation
#
###############################################################################


class Atom:
    def __init__(self, index=0, atom="H", charge=0, hash=None, bonds=None):
        self.index = index
        self.atom = atom
        self.charge = charge
        self.hash = hash
        self.bonds = bonds

    def __str__(self):
        return f"index: {self.index} | atom: {self.atom} | charge: {self.charge} | hash: {self.hash}"

    def log(self):
        print(self)

    def add_bond(self, bond):
        if self.bonds == None:
            self.bonds = []

        self.bonds.append(bond)


class Bond:
    def __init__(self, atoms=(), type=1):
        self.atoms = atoms
        self.type = type

    def __str__(self):
        return f"atom_left: {self.atoms[0].index} | atom_right: {self.atoms[1].index} | type: {self.type}"

    def log(self):
        print(self)


class Molecule:
    def __init__(self, atoms=[]):
        self.atoms = atoms

    def get_atom_by_index(self, index):
        for atom in self.atoms:
            if atom.index == index:
                return atom

    def get_atoms_by_hash(self, hash):
        response = []

        for atom in self.atoms:
            if atom.hash != None and atom.hash == hash:
                response.append(atom)

        return response

    def get_last_atom_index(self):
        response = -1

        for atom in self.atoms:
            if atom.index > response:
                response = atom.index

        return response

    def get_last_atom(self):
        last = self.get_last_atom_index()
        for atom in self.atoms:
            if atom.index == last:
                return atom

    def add_atom(self, atom, index=None, hash=None, bond_type=1):
        indexed_atom = self.get_atom_by_index(index)
        last_atom = self.get_last_atom()
        hash_atoms = self.get_atoms_by_hash(hash)

        if last_atom == None:
            atom.hash = hash
            self.atoms.append(atom)
            return

        atom.index = last_atom.index + 1

        if indexed_atom:
            atom.add_bond(Bond((atom, indexed_atom), bond_type))
            indexed_atom.add_bond(Bond((indexed_atom, atom), bond_type))

        if hash_atoms == None:
            atom.add_bond(Bond((atom, last_atom), bond_type))
            last_atom.add_bond(Bond((last_atom, atom), bond_type))
        elif len(hash_atoms) == 0 and hash != None:
            atom.hash = hash
            atom.add_bond(Bond((atom, last_atom), bond_type))
            last_atom.add_bond(Bond((last_atom, atom), bond_type))
        elif len(hash_atoms) != 0 and hash != None:
            atom.hash = hash
            atom.add_bond(Bond((atom, hash_atoms[0]), bond_type))
            hash_atoms[0].add_bond(Bond((hash_atoms[0], atom), bond_type))
        else:
            atom.add_bond(Bond((atom, last_atom), bond_type))
            last_atom.add_bond(Bond((last_atom, atom), bond_type))

        self.atoms.append(atom)


###############################################################################
#
#   List helpers
#
###############################################################################
def list_includes(list, element):
    for item in list:
        if item == element:
            return True

    return False


def list_to_str(list):
    str = ""

    for c in list:
        str += c

    return str


###############################################################################
#
#   Parser structure
#
###############################################################################

AtomSymbols = [
    "H",
    "He",
    "Li",
    "Be",
    "B",
    "C",
    "N",
    "O",
    "F",
    "Ne",
    "Na",
    "Mg",
    "Al",
    "Si",
    "P",
    "S",
    "Cl",
    "Ar",
    "K",
    "Ca",
    "Sc",
    "Ti",
    "V",
    "Cr",
    "Mn",
    "Fe",
    "Co",
    "Ni",
    "Cu",
    "Zn",
    "Ga",
    "Ge",
    "As",
    "Se",
    "Br",
    "Kr",
    "Rb",
    "Sr",
    "Y",
    "Zr",
    "Nb",
    "Mo",
    "Tc",
    "Ru",
    "Rh",
    "Pd",
    "Ag",
    "Cd",
    "In",
    "Sn",
    "Sb",
    "Te",
    "I",
    "Xe",
    "Cs",
    "Ba",
    "La",
    "Ce",
    "Pr",
    "Nd",
    "Pm",
    "Sm",
    "Eu",
    "Gd",
    "Tb",
    "Dy",
    "Ho",
    "Er",
    "Tm",
    "Yb",
    "Lu",
    "Hf",
    "Ta",
    "W",
    "Re",
    "Os",
    "Ir",
    "Pt",
    "Au",
    "Hg",
    "Tl",
    "Pb",
    "Bi",
    "Po",
    "At",
    "Rn",
    "Fr",
    "Ra",
    "Ac",
    "Th",
    "Pa",
    "U",
    "Np",
    "Pu",
    "Am",
    "Cm",
    "Bk",
    "Cf",
    "Es",
    "Fm",
    "Md",
    "No",
    "Lr",
    "Rf",
    "Db",
    "Sg",
    "Bh",
    "Hs",
    "Mt",
    "Ds",
    "Rg",
    "Cn",
    "Nh",
    "Fl",
    "Mc",
    "Lv",
    "Ts",
    "Og",
]

AromaticLowercaseSymbols = ["b", "c", "n", "o", "p", "s"]
SeparatorSymbols = ["[", "]", "(", ")"]
BondSymbols = [".", "-", "=", "#", "$", ":", "/", "\\", "@", "@@"]
ChargeSymbols = ["+", "-"]
SpecialSymbols = ["%"]

SingleCharKeywords = (
    AromaticLowercaseSymbols + SeparatorSymbols + BondSymbols + ChargeSymbols
)


class Token(Enum):
    # Atom tokens
    ATOM = 1
    LOWER_CASE_ATOM = 2

    # Bonds tokens
    BOUND_1 = 3
    BOUND_2 = 4
    BOUND_3 = 5
    BOUND_4 = 6
    AROMATIC_BOUND = 7
    DIRECTIONAL_UP_BOUND = 8
    DIRECTIONAL_DOWN_BOUND = 9

    # Configuration tokens
    DIRECTIONAL_CLOCK_WISE = 10
    DIRECTIONAL_COUNTER_CLOCK_WISE = 11

    # Separator tokens
    OPEN_ATOM_BRACKET = 12
    CLOSE_ATOM_BRACKET = 13
    OPEN_BRANCH_PARENTHESES = 14
    CLOSE_BRANCH_PARENTHESES = 15

    # Charge tokens
    POSITIVE_CHARGE = 16
    NEGATIVE_CHARGE = 17

    # Numerical constant tokens
    NUMERICAL_CONSTANT = 18
    FORCE_NUMERICAL_LABEL = 19


def get_tokens(smile):
    lexer_tree = []
    numeric_lexeme = ""

    count = 0
    while count < len(smile):
        token = smile[count]
        atom_token = ""
        if count + 1 < len(smile):
            atom_token = list_to_str([token, smile[count + 1]])
        else:
            atom_token = token

        if not token.isnumeric() and numeric_lexeme != "":
            lexer_tree.append(list_to_str(numeric_lexeme))
            numeric_lexeme = ""

        if atom_token == "@@":
            lexer_tree.append(atom_token)
            count += 2
            continue

        if list_includes(SingleCharKeywords, token):
            lexer_tree.append(token)
        elif list_includes(AtomSymbols, atom_token):
            lexer_tree.append(atom_token)
            count += 1
        elif list_includes(AtomSymbols, token):
            lexer_tree.append(token)
        elif list_includes(SpecialSymbols, token):
            lexer_tree.append(token)

        if token.isnumeric():
            numeric_lexeme += token

        count += 1

    return lexer_tree


def get_lexer_tree(smile):
    tokens = get_tokens(smile)
    lexer_tree = []

    for token in tokens:
        if list_includes(AtomSymbols, token):
            lexer_tree.append((Token.ATOM, token))
        elif list_includes(AromaticLowercaseSymbols, token):
            lexer_tree.append((Token.LOWER_CASE_ATOM, token))
        elif token == "[":
            lexer_tree.append((Token.OPEN_ATOM_BRACKET, token))
        elif token == "]":
            lexer_tree.append((Token.CLOSE_ATOM_BRACKET, token))
        elif token == "(":
            lexer_tree.append((Token.OPEN_BRANCH_PARENTHESES, token))
        elif token == ")":
            lexer_tree.append((Token.CLOSE_BRANCH_PARENTHESES, token))
        elif token == ".":
            lexer_tree.append((Token.BOUND_1, token))
        elif token == "-":
            lexer_tree.append((Token.BOUND_1, token))
        elif token == "=":
            lexer_tree.append((Token.BOUND_2, token))
        elif token == "#":
            lexer_tree.append((Token.BOUND_3, token))
        elif token == "$":
            lexer_tree.append((Token.BOUND_4, token))
        elif token == ":":
            lexer_tree.append((Token.AROMATIC_BOUND, token))
        elif token == "/":
            lexer_tree.append((Token.DIRECTIONAL_UP_BOUND, token))
        elif token == "\\":
            lexer_tree.append((Token.DIRECTIONAL_DOWN_BOUND, token))
        elif token == "@@":
            lexer_tree.append((Token.DIRECTIONAL_CLOCK_WISE, token))
        elif token == "@":
            lexer_tree.append((Token.DIRECTIONAL_COUNTER_CLOCK_WISE, token))
        elif token == "+":
            lexer_tree.append((Token.POSITIVE_CHARGE, token))
        elif token == "-":
            lexer_tree.append((Token.NEGATIVE_CHARGE, token))
        elif token == "%":
            lexer_tree.append((Token.FORCE_NUMERICAL_LABEL, token))
        elif token.isnumeric():
            lexer_tree.append((Token.NUMERICAL_CONSTANT, token))

    return lexer_tree


lex = get_lexer_tree("[C%11]ClCnCN")
for token in lex:
    print(f"{token[1]} : {token[0]}")

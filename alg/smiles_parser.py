#!/bin/python3


class Atom:
    def __init__(self, index=0, atom="H", charge=0, hash=None, bounds=None):
        self.index = index
        self.atom = atom
        self.charge = charge
        self.hash = hash
        self.bounds = bounds

    def __str__(self):
        return f"index: {self.index} | atom: {self.atom} | charge: {self.charge} | hash: {self.hash}"

    def log(self):
        print(self)

    def add_bound(self, bound):
        if self.bounds == None:
            self.bounds = []

        self.bounds.append(bound)


class Bound:
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


    def add_atom(self, atom, index=None, hash=None, bound_type=1):
        indexed_atom = self.get_atom_by_index(index)
        last_atom = self.get_last_atom()
        hash_atoms = self.get_atoms_by_hash(hash)

        if last_atom == None:
            atom.hash = hash
            self.atoms.append(atom)
            return

        atom.index = last_atom.index + 1

        if indexed_atom:
            atom.add_bound(Bound((atom, indexed_atom), bound_type))
            indexed_atom.add_bound(Bound((indexed_atom, atom), bound_type))

        if hash_atoms == None:
            atom.add_bound(Bound((atom, last_atom), bound_type))
            last_atom.add_bound(Bound((last_atom, atom), bound_type))
        elif len(hash_atoms) == 0 and hash != None:
            atom.hash = hash
            atom.add_bound(Bound((atom, last_atom), bound_type))
            last_atom.add_bound(Bound((last_atom, atom), bound_type))
        elif len(hash_atoms) != 0 and hash != None:
            atom.hash = hash
            atom.add_bound(Bound((atom, hash_atoms[0]), bound_type))
            hash_atoms[0].add_bound(Bound((hash_atoms[0], atom), bound_type))
        else:
            atom.add_bound(Bound((atom, last_atom), bound_type))
            last_atom.add_bound(Bound((last_atom, atom), bound_type))

        self.atoms.append(atom)


mol = Molecule()
mol.add_atom(Atom(atom="H"))
mol.add_atom(Atom(atom="C"))
mol.add_atom(Atom(atom="Cl"))
mol.add_atom(Atom(atom="Cl"))
mol.add_atom(Atom(atom="Cl"))
mol.add_atom(Atom(atom="O"))
mol.add_atom(Atom(atom="O"))
mol.add_atom(Atom(atom="O"))

for atom in mol.atoms:
    print("==================")
    print(f"Atom: {atom.index}")
    for bound in atom.bounds:
        print(bound)

class_name PDBParser


static func defineCell(p: Protein):
	if p.a == null:
		return

	p.ax = p.a
	p.ay = 0
	p.az = 0
	p.bx = p.b * cos(deg_to_rad(p.gamma))
	p.by = p.b * sin(deg_to_rad(p.gamma))
	p.bz = 0
	p.cx = p.c * cos(deg_to_rad(p.beta))
	p.cy = p.c * (cos(deg_to_rad(p.alpha)) - cos(deg_to_rad(p.gamma)) * cos(deg_to_rad(p.beta))) / sin(deg_to_rad(p.gamma))
	p.cz = sqrt(p.c * p.c * sin(deg_to_rad(p.beta)) * sin(deg_to_rad(p.beta)) - p.cy * p.cy)


static func createIdentityMatrix4x4() -> PackedFloat32Array:
	var identity_matrix = PackedFloat32Array()

	for i in range(4):
		for j in range(4):
			if i == j:
				identity_matrix.append(1.0)
			else:
				identity_matrix.append(0.0)

	return identity_matrix


static func parse(input: String):
	var atoms = []
	var protein = Protein.new()
	var lines = input.split("\n")

	for i in range(lines.size()):
		var line = lines[i].strip_edges()  # Remove leading and trailing whitespace
		var recordName = line.substr(0, 6)
		atoms.append({
			"resn": null,
			"x": null,
			"y": null,
			"z": null,
			"elem": null,
			"hetflag": null,
			"chain": null,
			"resi": null,
			"serial": null,
			"atom": null,
			"bonds": null,
			"ss": null,
			"color": null,
			"bondOrder": null,
			"b": null,
		})

		if recordName == 'ATOM  ' or recordName == 'HETATM':
			var atom
			var resn
			var chain 
			var resi
			var x 
			var y
			var z
			var hetflag
			var elem 
			var serial
			var altLoc
			var b
			altLoc = line.substr(16, 1)

			if altLoc != ' ' and altLoc != 'A':
				continue

			serial = int(line.substr(6, 5))
			atom = line.substr(12, 4).replace(" ", "")
			resn = line.substr(17, 3)
			chain = line.substr(21, 1)
			resi = int(line.substr(22, 5))
			x = float(line.substr(30, 8))
			y = float(line.substr(38, 8))
			z = float(line.substr(46, 8))
			b = float(line.substr(60, 8))
			elem = line.substr(76, 2).replace(" ", "")

			if elem == '':
				elem = line.substr(12, 4).replace(" ", "")

			hetflag = (line[0] == 'H')

			atoms[serial] = {
				"resn": resn,
				"x": x,
				"y": y,
				"z": z,
				"elem": elem.to_upper(),
				"hetflag": hetflag,
				"chain": chain,
				"resi": resi,
				"serial": serial,
				"atom": atom,
				"bonds": [],
				"ss": 'c',
				"color": Color(1, 1, 1),  # Assuming white color
				"bondOrder": [],
				"b": b,
			}

		elif recordName == 'SHEET ':
			var startChain = line.substr(21, 1)
			var startResi = int(line.substr(22, 4))
			var endChain = line.substr(32, 1)
			var endResi = int(line.substr(33, 4))
			protein.sheet.append([startChain, startResi, endChain, endResi])

		elif recordName == 'CONECT':
			var from = int(line.substr(6, 5))
			for j in range(4):
				var to = int(line.substr([11, 16, 21, 26][j], 5))
				if is_nan(to):
					continue
				if atoms.has(from):
					atoms[from]["bonds"].append(to)
					atoms[from]["bondOrder"].append(1)

		elif recordName == 'HELIX ':
			var startChain = line.substr(19, 1)
			var startResi = int(line.substr(21, 4))
			var endChain = line.substr(31, 1)
			var endResi = int(line.substr(33, 4))
			protein.helix.append([startChain, startResi, endChain, endResi])

		elif recordName == 'CRYST1':
			protein.a = float(line.substr(6, 9))
			protein.b = float(line.substr(15, 9))
			protein.c = float(line.substr(24, 9))
			protein.alpha = float(line.substr(33, 7))
			protein.beta = float(line.substr(40, 7))
			protein.gamma = float(line.substr(47, 7))
			protein.spacegroup = line.substr(55, 11)
			defineCell(protein)

		elif recordName == 'REMARK':
			var type = int(line.substr(7, 3))
			if type == 290 and line.substr(13, 5) == 'SMTRY':
				var n = int(line[18]) - 1
				var m = int(line.substr(21, 2))
				if not protein.symMat.has(m):
					protein.symMat[m] = createIdentityMatrix4x4()
				protein.symMat[m][n] = float(line.substr(24, 9))
				protein.symMat[m][n + 4] = float(line.substr(34, 9))
				protein.symMat[m][n + 8] = float(line.substr(44, 9))
				protein.symMat[m][n + 12] = float(line.substr(54, 10))
			elif type == 350 and line.substr(13, 5) == 'BIOMT':
				var n = int(line[18]) - 1
				var m = int(line.substr(21, 2))
				if m + 1 > protein.biomtMatrices.size():
					protein.biomtMatrices.resize(m + 1)
				if protein.biomtMatrices[m].size() == 0:
					protein.biomtMatrices[m] = createIdentityMatrix4x4()
				protein.biomtMatrices[m][n] = float(line.substr(24, 9))
				protein.biomtMatrices[m][n + 4] = float(line.substr(34, 9))
				protein.biomtMatrices[m][n + 8] = float(line.substr(44, 9))
				protein.biomtMatrices[m][n + 12] = float(line.substr(54, 10))
			elif type == 350 and line.substr(11, 11) == 'BIOMOLECULE':
				# protein.biomtMatrices = Array()
				protein.biomtChains = ''
			elif type == 350 and line.substr(34, 6) == 'CHAINS':
				protein.biomtChains += line.substr(41, 40)

		elif recordName == 'HEADER':
			protein.pdbID = line.substr(62, 4)

		elif recordName == 'TITLE ':
			if protein.title == null:
				protein.title = ""
			protein.title += line.substr(10, 70) + "\n"  # Concatenate titles
		elif recordName == 'COMPND':
			pass

	for i in range(atoms.size()):
		var atom = atoms[i]
		if atom == null:
			continue

		for j in range(protein.sheet.size()):
			if atom["chain"] != protein.sheet[j][0]:
				continue
			if atom["resi"] < protein.sheet[j][1]:
				continue
			if atom["resi"] > protein.sheet[j][3]:
				continue

			atom["ss"] = 's'
			if atom["resi"] == protein.sheet[j][1]:
				atom["ssbegin"] = true
			if atom["resi"] == protein.sheet[j][3]:
				atom["ssend"] = true

		for j in range(protein.helix.size()):
			if atom["chain"] != protein.helix[j][0]:
				continue
			if atom["resi"] < protein.helix[j][1]:
				continue
			if atom["resi"] > protein.helix[j][3]:
				continue

			atom["ss"] = 'h'
			if atom["resi"] == protein.helix[j][1]:
				atom["ssbegin"] = true
			elif atom["resi"] == protein.helix[j][3]:
				atom["ssend"] = true

	protein.smallMolecule = false

	return {
		"atoms": atoms,
		"pretein": protein,
	}

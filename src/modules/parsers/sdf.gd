class_name SDFParser

static func parse(input: String):
	var atoms = []

	var lines = input.split("\n")
	var offset = 3
	if lines.size() < 4:
		return false
	var atomCount = lines[offset].substr(0, 3).to_int()
	if atomCount <= 0:
		return false
		
	var bondCount = int(lines[offset].substr(3, 3))

	if lines.size() < 4 + atomCount + bondCount:
		return false

	for i in range(1, atomCount + 1):
		var line = lines[offset + i]
		var atom = {
			"serial": i,
			"x": float(line.substr(0, 10)),
			"y": float(line.substr(10, 10)),
			"z": float(line.substr(20, 10)),
			"hetflag": true,
			"atom": line.substr(31, 3).strip_edges().to_upper(),
			"bonds": [],
			"bondOrder": [],
		}
		atoms.append(atom)

	for i in range(1, bondCount + 1):
		var line = lines[offset + atomCount + i]
		var from = int(line.substr(0, 3))
		var to = int(line.substr(3, 3))
		var order = int(line.substr(6, 3))
		atoms[from - 1]["bonds"].append(to)
		atoms[from - 1]["bondOrder"].append(order)
		atoms[to - 1]["bonds"].append(from)
		atoms[to - 1]["bondOrder"].append(order)

	return {
		"atoms": atoms,
		"protein": null,
	}

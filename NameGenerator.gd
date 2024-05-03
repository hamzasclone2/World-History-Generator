extends Node

@onready var label = get_node("Label")

var totalSyllables = 50
var totalNames = 100
var totalFullNames = 20

var vowels = ['a', 'e', 'i', 'o', 'u', 'ai', 'ao', 'au', 'ee', 'ei', 'oi', 'ou', 'oo']
var consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'qu', 'r', 's', 't', 'v', 'w', 'y', 'z', 'bl', 'cl', 'fl', 'gl', 'pl', 'br', 'cr', 'dr', 'fr', 'gr', 'pr', 'tr', 'sk', 'sl', 'sp', 'st', 'sw', 'spr', 'str', 'ch', 'sh', 'th', 'wh', 'zh']
var endingConsonants = ['b', 'c', 'd', 'f', 'g', 'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'v', 'ks', 'z', 'sk', 'st', 'ch', 'sh', 'th']
var syllables = []
var names = []
var fullNames = []

var rng = RandomNumberGenerator.new()

func _ready():
	generateSyllables()
	generateName()
	generateFullNames()
	fullNamesToString()
	
func fullNamesToString():
	for a in fullNames:
		label.text += a
		label.text += "\n"
	
func generateSyllables():
	rng.randomize()
	var index
	var temp
	var syllableType
	
	while syllables.size() < totalSyllables:
		syllableType = rng.randi_range(0,2)
		temp = ""
		if syllableType == 0: # CVC
			index = rng.randi_range(0, consonants.size()-1)
			temp += consonants[index]
			index = rng.randi_range(0, vowels.size()-1)
			temp += vowels[index]
			index = rng.randi_range(0, endingConsonants.size()-1)
			temp += endingConsonants[index]
		elif syllableType == 1: # VC
			index = rng.randi_range(0, vowels.size()-1)
			temp += vowels[index]
			index = rng.randi_range(0, endingConsonants.size()-1)
			temp += endingConsonants[index]
		elif syllableType == 2: # CV
			index = rng.randi_range(0, consonants.size()-1)
			temp += consonants[index]
			index = rng.randi_range(0, vowels.size()-1)
			temp += vowels[index]
			
		if not temp in syllables:
			syllables.append(temp)

func generateName():
	rng.randomize()
	var numSyllables
	var index
	var temp = ""
	
	while names.size() < totalNames:
		temp = ""
		numSyllables = calculateSyllables()
		for j in numSyllables:
			index = rng.randi_range(0, syllables.size()-1)
			temp += syllables[index]
		temp = temp.capitalize()
		
		if not temp in names:
			temp = checkName(temp)
			names.append(temp)
	
func generateFullNames():
	rng.randomize()
	var index
	var temp = ""
	
	for i in totalFullNames:
		temp = ""
		index = rng.randi_range(0, totalNames-1)
		temp += names[index]
		temp += " "
		index = rng.randi_range(0, totalNames-1)
		temp += names[index]
			
		if not temp in fullNames:
			fullNames.append(temp)
	
func checkName(name):
	var numVowelsInARow = 0
	var index = 0
	for i in name:
		index += 1
		if i in vowels:
			numVowelsInARow += 1
		else: 
			numVowelsInARow = 0
		if numVowelsInARow >= 3:
			name.erase(index - 2 , 1)
	return name
	
func calculateSyllables():
	# 1 syllable:  35%
	# 2 syllables: 50%
	# 3 syllables: 10%
	# 4 syllables: 5%
	var temp = 0
	rng.randomize()
	temp = rng.randi_range(1,100)
	if temp < 35:
		return 1
	elif temp < 85:
		return 2
	elif temp < 95:
		return 3
	else:
		return 4

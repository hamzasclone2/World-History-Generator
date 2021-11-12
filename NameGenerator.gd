extends Node

var totalSyllables = 15
var totalNames = 50
var totalFullNames = 100

var vowels = ['a', 'e', 'i', 'o', 'u', 'ae', 'ai', 'ao', 'au', 'ea', 'ee', 'ei', 'eo', 'eu', 'ia', 'ie', 'io', 'iu', 'oa', 'oe', 'oi', 'ou', 'oo', 'ua', 'ue', 'ui', 'uo']
var consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z', 'bl', 'cl', 'fl', 'gl', 'pl', 'br', 'cr', 'dr', 'fr', 'gr', 'pr', 'tr', 'sk', 'sl', 'sp', 'st', 'sw', 'spr', 'str', 'ch', 'sh', 'th', 'wh', 'zh']
var syllables = []
var names = []
var fullNames = []

var rng = RandomNumberGenerator.new()

func _ready():
	generateSyllables()
	generateName()
	generateFullNames()
	
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
			index = rng.randi_range(0, consonants.size()-1)
			temp += consonants[index]
		elif syllableType == 1: # VC
			index = rng.randi_range(0, vowels.size()-1)
			temp += vowels[index]
			index = rng.randi_range(0, consonants.size()-1)
			temp += consonants[index]
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
		numSyllables = rng.randi_range(1,2)
		for j in numSyllables:
			index = rng.randi_range(0, syllables.size()-1)
			temp += syllables[index]
		temp = temp.capitalize()
		
		if not temp in names:
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
	print(fullNames)

extends Node

var vowels = ['a', 'e', 'i', 'o', 'u', 'oo', 'ee']
var rControlledVowels = ['ar', 'er', 'or']
var consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']
var blends = ['bl', 'cl', 'fl', 'gl', 'pl', 'br', 'cr', 'dr', 'fr', 'gr', 'pr', 'tr', 'sk', 'sl', 'sp', 'st', 'sw', 'spr', 'str']
var digraphs = ['ch', 'sh', 'th', 'wh', 'zh']
var syllables = []
var names = []

var rng = RandomNumberGenerator.new()

func _ready():
	generateSyllables()
	generateName()
	
func generateSyllables():
	rng.randomize()
	var index
	var temp
	
	for i in 25:
		temp = ""
		index = rng.randi_range(0, consonants.size()-1)
		temp += consonants[index]
		index = rng.randi_range(0, vowels.size()-1)
		temp += vowels[index]
		index = rng.randi_range(0, consonants.size()-1)
		temp += consonants[index]
		syllables.append(temp)
	print(syllables)

func generateName():
	rng.randomize()
	var numSyllables
	var index
	var temp = ""
	
	for i in 10:
		temp = ""
		numSyllables = rng.randi_range(1, 4)
		for j in numSyllables:
			index = rng.randi_range(0, syllables.size()-1)
			temp += syllables[index]
		names.append(temp)
	print(names)

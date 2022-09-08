extends Node

var personName
var age

var ages = []

var rng = RandomNumberGenerator.new()

func _ready():
	
	personName = NameGenerator.fullNames.pop_front()
	
	rng.randomize()
	
	for n in 100:
		
		var temp = rng.randf_range(0, 100)
		
		if temp < 18.2:
			age = rng.randi_range(0, 14)
		elif temp < 31.2:
			age = rng.randi_range(15, 24)
		elif temp < 44.9:
			age = rng.randi_range(25, 34)
		elif temp < 58:
			age = rng.randi_range(35, 44)
		elif temp < 70.3:
			age = rng.randi_range(45, 54)
		elif temp < 83.2:
			age = rng.randi_range(55, 64)
		else:
			age = rng.randi_range(65, 80)
		
		ages.append(age)
	
	ages.sort()
	print(ages)
	
	

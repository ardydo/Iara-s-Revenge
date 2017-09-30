extends Area2D

func collides(thing):
	print(thing)
	if "guard" in thing:
		if thing.guard:
			thing.autoMoves = false
			thing.follow = true
			print(thing.follow)

func _ready():
	connect("area_enter", self, "collides")
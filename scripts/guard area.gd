extends Area2D

func collides(thing):
	# print(thing)
	if "guard" in thing:
		if thing.guard:
			if "go" in thing:
				thing.go = true

func _ready():
	connect("area_enter", self, "collides")
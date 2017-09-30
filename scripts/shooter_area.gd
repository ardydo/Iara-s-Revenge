extends Area2D

func collides(thing):
	
	if "shooter" in thing:
		if thing.shooter:
			if "go" in thing:
				print(thing.get_name())
				thing.go = true

func _ready():
	connect("area_enter", self, "collides")

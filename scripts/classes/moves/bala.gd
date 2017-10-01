extends "res://scripts/classes/moves.gd"
var shootPow = 0

func _ready():
	score = 0
	pass

func _fixed_process(delta):
	set_pos(Vector2(get_pos().x + speed * dir ,get_pos().y))
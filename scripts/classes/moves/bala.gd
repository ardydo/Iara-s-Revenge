extends "res://scripts/classes/moves.gd"
var shootPow = 0

func _ready():
	speed = 2

func _fixed_process(delta):
	set_pos(Vector2(get_pos().x + speed,get_pos().y))
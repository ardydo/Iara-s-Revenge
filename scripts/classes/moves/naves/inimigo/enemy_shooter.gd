extends "res://scripts/classes/moves/naves/inimigo.gd"

func _init():
	shootCD = 1.5

func _process(delta):
	if go:
		go = false
		shooter = false
		autoMoves = false
		shootAuto = true

func _ready():
	shooter = true
	shootAmmo = preload("res://objects/projectiles/fireball.tscn")
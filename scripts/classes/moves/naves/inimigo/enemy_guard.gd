extends "res://scripts/classes/moves/naves/inimigo.gd"

func _init():
	maxHealth = 3

func _process(delta):
	if go:
		go = false
		guard = false
		autoMoves = false
		follow = true
		# print(thing.follow)

func _ready():
	guard = true
extends "res://scripts/classes/moves/naves/inimigo.gd"

func _init():
	shootCD = 1.5

func shooter():
	print("alo?")
	print(shootTimer.get_wait_time())

func _process(delta):
	if go:
		go = false
		shooter = false
		autoMoves = false
		shootAuto = true

func _ready():
	shooter = true
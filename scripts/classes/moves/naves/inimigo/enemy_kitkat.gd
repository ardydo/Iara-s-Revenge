extends "res://scripts/classes/moves/naves/inimigo.gd"

var activateTimer = Timer.new()
var activateCD = 3

func _init():
	shootSpeed = 2.5

func time_to_bang():
	shoot()
	autoMoves = true

func _process(delta):
	if go:
		autoMoves = false
		print("curipira" + str(shooter))
		go = false
		shooter = false
		activateTimer.start()

func _ready():
	shooter = true
	add_child(activateTimer)
	activateTimer.set_wait_time(activateCD)
	activateTimer.set_one_shot(true)
	activateTimer.connect("timeout", self, "time_to_bang")
	shootAmmo = preload("res://objects/projectiles/lance.tscn")
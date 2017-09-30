extends "res://scripts/classes/moves/naves.gd"
var guard = false
var follow = false
var followSpeed = 0.5
var followTarget = null

func _fixed_process():
	if follow:
		print("ahoy!")
		var a = followTarget.get_pos().y
		var b = get_pos().y
		var followDir = Vector2(0,b - a)
		set_pos(followDir * followSpeed)

func _ready():
	set_process(true)
	dir =  -1
	shootAuto = false
	
	followTarget = get_parent().get_node("octopedro")

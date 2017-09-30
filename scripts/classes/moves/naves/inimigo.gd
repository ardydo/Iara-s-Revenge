extends "res://scripts/classes/moves/naves.gd"
var go = false

# substitute vars
var substitute = false
var subThing = preload ("res://objects/enemies/enemy_def.tscn")

# guard vars
var guard = false
var follow = false
var followQuick = false
var followSpeed = 0.5
onready var followTarget = get_node("../stage/octopedro")

# shooter vars
var shooter = false

func destroy():
	if substitute:
		print("sub!")
		var sub = subThing.instance()
		get_parent().add_child(sub)
		print(sub)
		sub.set_pos(get_global_pos())
		
	queue_free()

func _fixed_process(delta):
	if follow:
		var pos = get_pos()
		var curY = pos.y
		var tarY = followTarget.get_pos().y
		var followDir = Vector2()
		
		if followQuick:
			follow = false
			followDir = Vector2(0,tarY - curY)
			set_pos(get_pos() + followDir * followSpeed)
			pass
		else:
			if tarY < curY:
				followDir = Vector2(0, -1)
			if tarY > curY:
				followDir = Vector2(0, 1)
			if tarY == curY:
				followDir = Vector2(0, 0)
			set_pos(pos + followDir * followSpeed)

func _ready():
	set_process(true)
	dir =  -1
	shootAuto = false

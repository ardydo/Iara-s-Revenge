extends "res://scripts/classes/moves/naves/inimigo/enemy_shooter.gd"

onready var spriteNode = get_node("Sprite")

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
	
	# load the textures
	var sprite0 = preload("res://assets/pasquin1.png")
	var sprite1 = preload("res://assets/pasquin2.png")
	var sprite2 = preload("res://assets/pasquin3.png")
	var sprite3 = preload("res://assets/pasquin4.png")

	# put the textures into a list
	var sprites = [sprite0, sprite1, sprite2, sprite3]

	# list of node names - could make this automatically using get_children
	var nodes = sprite.get_children()
	# pick a random item from list
	var spritePick = sprites[randi() % sprites.size()]
	print(spritePick)
	
	# assign the texture
	get_node("Sprite").set_texture(spritePick)
	shootAmmo = preload("res://objects/projectiles/generic_bullet.tscn")
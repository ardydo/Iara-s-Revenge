extends "res://scripts/classes/moves.gd"
# required nodes
# area 2d named "shootFrom"
# timer named shootTimer

var health = 1
#shooting vars
var shootAmmo = preload("res://objects/projectiles/generic_bullet.tscn")
var shootPow = 1
var shootCD = 1
var shootAble = true
var shootAuto = true #auto shoot var
onready var shootTimer = get_node("shootTimer")

func shoot():
	if shootAble:
		shootAble = false
		var bullet = shootAmmo.instance()
		bullet.set_pos(get_node("shootFrom").get_global_pos())
		bullet.shootPow = shootPow
		bullet.alinhamento = alinhamento
		get_parent().add_child(bullet)
		
		shootTimer.start()
		print(shootTimer.get_wait_time())

func shoot_timer_over():
	print("carregado!")
	shootAble = true

func damage(a):
	health -= a
	if health <= 0:
		destroy()

func collides(thing):
	if thing.alinhamento != alinhamento:
		damage(thing.shootPow)
		thing.destroy()
		print("aiai")

func _process(delta):
	if shootAuto:
		shoot()

func _ready():
	#timer config
	shootTimer.set_one_shot(true)
	shootTimer.set_wait_time(shootCD)
	shootTimer.connect("timeout", self, "shoot_timer_over")
	
	set_process(true)
	
	self.connect("area_enter", self, "collides")
	

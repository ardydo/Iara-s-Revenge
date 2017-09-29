extends "res://scripts/classes/moves.gd"
# required nodes
# area 2d named "shootFrom"
# timer named shootTimer

export var alinhamento = 1
var health = 1
#shooting vars
var shootAmmo = preload("res://objects/projectiles/generic_bullet.tscn")
var shootPow = 1
var shootCD = 2
var shootAble = true
var shootAuto = true #auto shoot var
onready var shootTimer = get_node("shootTimer")

func shoot():
		shootAble = false
		var bullet = shootAmmo.instance()
		bullet.set_pos(get_node("shootFrom").get_global_pos())
		bullet.shootPow = shootPow
		get_parent().add_child(bullet)
		
		shootTimer.start()

func shoot_timer_over():
	print("acabou!")
	shootAble = true

func damage(a):
	health -= a
	if health <= 0:
		queue_free()

func _process(delta):
	print(shootTimer.get_time_left())
	if shootAuto and shootAble:
		shoot()

func _ready():
	#timer config
	shootTimer.set_one_shot(true)
	shootTimer.set_wait_time(shootCD)
	shootTimer.connect("timeout", self, "shoot_timer_over")
	
	set_process(true)
	

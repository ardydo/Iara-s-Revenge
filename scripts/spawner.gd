extends Position2D

var height = Globals.get("display/height")
var x
var y

var timer = Timer.new()
var timerMin = 1.0
var timerMax = 4.0


onready var enemyList = [ 
	preload("res://objects/enemies/enemy_def.tscn"),
	preload("res://objects/enemies/enemy_boto.tscn"),
	preload("res://objects/enemies/enemy_guard.tscn"),
	preload("res://objects/enemies/enemy_kitkat.tscn"),
	preload("res://objects/enemies/enemy_shooter.tscn"),
	]

func timeout():
	#var word = words[randi() % words.size()]
	var spawn = enemyList[randi() % enemyList.size()].instance()
	spawn.set_pos(get_global_pos())
	get_parent().add_child(spawn)
	
	timer_go()
	
func timer_go():
	timer.set_wait_time(rand_range(timerMin, timerMax))
	timer.start()	

func _process(delta):
	set_pos( Vector2(x , rand_range(y, height)))

func _ready():
	set_process(true)
	print("ready!")
	x = get_pos().x
	print (timer)
	add_child(timer)
	timer.connect("timeout", self, "timeout")
	timer.set_one_shot(true)
	
	y = get_pos().y
	
	timer_go()
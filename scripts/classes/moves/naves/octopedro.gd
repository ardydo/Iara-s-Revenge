extends "res://scripts/classes/moves/naves.gd"

var movimento = Vector2()
var pos
var shooting = false


func _ready():
	speed = 2
	alinhamento = 0
	set_process_input(true)
	autoMoves = false
	shootAuto = false
	shootCD = 0.5

func _input(event):
	shooting = Input.is_action_pressed("ui_accept")
	movimento = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		movimento += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		movimento += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		movimento += Vector2( 1, 0 )
	if Input.is_action_pressed("ui_left"):
		movimento += Vector2( -1, 0 )

func _process(delta):
	if shooting:
		shoot()

func _fixed_process(delta):
	#movendo
	pos = get_pos()
	pos += movimento * speed
	set_pos(pos)
	#mantendo dentro da tela
	var screen_size = OS.get_window_size()
	
	if (pos.x < 0):
		pos.x = 0
	if (pos.x > screen_size.x):
		pos.x = screen_size.x
	if (pos.y < 0):
		pos.y = 0
	if (pos.y > screen_size.y):
		pos.y = screen_size.y
	
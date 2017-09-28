extends Node
var a = (256*4)
var b = (224*4)
var next = false
var nextLevel = ""

func _get_big():
	OS.set_window_size(Vector2(b, a))

func _spaceBg():
	var bg = preload("res://backgroud.tscn").instance()
	bg.set_pos(Vector2(0,0))

func _ready():
	_get_big()
	_spaceBg()
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_accept"):
		if next:
			next = false
			get_tree().change_scene(nextLevel)

func _scene_changer(scene):
	global.next = true
	global.nextLevel = scene
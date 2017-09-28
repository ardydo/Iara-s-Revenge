extends Node

var a = (256*4)
var b = (224*4)

func _get_big():
	OS.set_window_size(Vector2(b, a))

func _spaceBg():
	var bg = preload("res://backgroud.tscn").instance()
	bg.set_pos(Vector2(0,0))

func _ready():
	_get_big()
	_spaceBg()
    
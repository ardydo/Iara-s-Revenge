extends Area2D

var speed = 16
var active = false
var useless = false

func _fixed_process(delta):
	var motion = Vector2()
	var pos = get_pos()
	pos += motion*delta*speed
	set_pos(pos)
	
func _on_visibility_enter_screen():
	active = true

func _on_visibility_exit_screen():
	useless = true
	if useless and active:
		queue_free()

func _ready():
	set_fixed_process(true)

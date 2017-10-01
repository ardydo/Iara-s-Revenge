extends Control

onready var high = get_node("highscore")
onready var cur = get_node("score")
var over = false
onready var gameover = get_node("gameover")

func _ready():
	high.set_text("HIGH: " + str(global.high_score))
	cur.set_text(str(global.score))
	set_process(true)

func _process(delta):
	var a = str(global.score)
	if a != cur.get_text():
		cur.set_text(a)
		
	if over:
		gameover.set_hidden(false)

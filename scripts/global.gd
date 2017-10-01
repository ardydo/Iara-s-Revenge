extends Node
var a = (256*4)
var b = (224*4)
var next = false
var nextLevel = ""
var score = 0
var high_score = 0

#save vars
var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file

func create_save():
	print("creating save")
	savegame.open(save_path, File.WRITE)
	savegame.close()
	
	print(savegame)

func save_score(value):
	savegame.open(save_path, File.WRITE)
	savegame.store_var(value)
	savegame.close()
	print("score saved: " + str(value))
	
func load_score():
	savegame.open(save_path, File.READ) #open the file
	high_score = savegame.get_var() #get the value
	savegame.close()

func _get_big():
	OS.set_window_size(Vector2(b, a))

func _spaceBg():
	var bg = preload("res://backgroud.tscn").instance()
	bg.set_pos(Vector2(0,0))

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

func score(value):
	score += value
	if value != 0:
		print(score)

func game_over():
	if score > high_score:
		save_score(score)

func _ready():
	_get_big()
	_spaceBg()
	set_process_input(true)
	randomize()
	
	# save stuff
	print( savegame.file_exists(save_path))
	
	if !savegame.file_exists(save_path):
		create_save()
		save_score(high_score)
	
	load_score()
	print(high_score)
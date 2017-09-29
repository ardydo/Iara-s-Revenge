extends Area2D
# required nodes
# visibility2d called visible

var maxHealth = 1
var health = maxHealth

export var alinhamento = 1
var speed = 1
var dir = 1
var active = false
var useless = false
export var autoMoves = true
# invul vars
var invul = false
var invulAble = false
var invulDur = 1.5
var invulTimer = Timer.new()

func _fixed_process(delta):
	#moves
	if autoMoves and active:
		set_pos(Vector2(get_pos().x + (dir * speed), get_pos().y))

func activate():
	active = true
	# print("aloalo")

func deactivate():
	useless = true
	if useless and active:
		# print("morri!" + str(self))
		queue_free()

func damage(a):
	if not invul:
		invul = true
		health -= a
		if health <= 0:
			destroy()
		if invulAble:
			invulTimer.start()
func invul_timeout():
	invul = false

func destroy():
	queue_free()

func collides(thing):
	if thing.alinhamento != alinhamento:
		damage(thing.shootPow)
		print("aiai")

func _ready():
	set_fixed_process(true)
	
	#visibility connections
	var visible = get_node("Visible")
	visible.connect("enter_screen", self, "activate")
	visible.connect("exit_screen", self, "deactivate")
	connect("area_enter", self, "collides")
	# invulnerability timer
	add_child(invulTimer)
	invulTimer.set_wait_time(invulDur)
	invulTimer.set_one_shot(true)
	invulTimer.connect("timeout", self, "invul_timeout")
	health = maxHealth
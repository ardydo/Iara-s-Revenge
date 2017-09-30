extends Node2D

#values
var maxValue = 0.0
var curentValue = 0.0

onready var health = get_node("health")
onready var health_text = get_node("health_text")

func setup(maxV, curV):
	maxValue = maxV
	curentValue = clamp(curV, 0, maxV)
	update()

func update():
	print(str(curentValue) + "/" + str(maxValue))
	var percent = curentValue / maxValue
	health.set_scale (Vector2 (percent, 1))
	health_text.set_text((str(curentValue) + "/" + str(maxValue)))

func set_health(value):
	curentValue = clamp(value, 0, maxValue)
	
	update()
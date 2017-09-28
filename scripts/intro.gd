extends Label
var intro = ""

func _ready():
	intro = "Depois de ter seu castelo destruído, Octopedro fugiu para a praia mas as criaturas do mar ainda o perseguiam mandando onda após onda para tentar trazê-lo de volta às profundezas do mar. Enquanto pulava, pensava em quantos favores iria cobrar de Iemanjá depois de tantas ondas. Ofendida com o desrespeito de Octopedro a própria Iemanjá manda uma onda gigante, grande demais para Octopedro pular. Entretanto, a onda foi tão grande que acabou por levar Octopedro ao espaço. Iemanjá ordena que as criaturas mitológicas vão dar uma lição em Octopedro."
	set_text(intro)
	global._scene_changer("res://title.tscn")
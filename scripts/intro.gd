extends Label
var intro = ""

func _ready():
	intro = "Depois de ter seu castelo destruído pelas criaturas do mar, Octopedro fugiu para a praia, mas as criaturas ainda o perseguiam mandando onda após onda para tentar trazê-lo de volta às profundezas do mar. Depois de pular tantas e tantas ondas, Octopedro chega ao espaço. Entretanto, as ondas levaram o lixo do mar para os rios. A protetora das águas, Iara, sabendo da inocência dos seres marinhos, ordena que as criaturas mitológicas e Marcos Pasquim deem uma lição em Octopedro."
	set_text(intro)
	global._scene_changer("res://title.tscn")
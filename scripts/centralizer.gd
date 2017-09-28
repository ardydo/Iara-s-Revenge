extends Label

func _centralizer():
	self.set_align(1)
	self.set_valign(1)    
	self.set_autowrap(true)

func _ready():
	_centralizer()
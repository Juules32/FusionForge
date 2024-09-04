extends Effect
class_name DrawEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, _target: Creature) -> void:
	for i in range(amount):
		Game.draw_card()
	print("Drew " + str(amount) + " cards")
	
func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var description: String
	if amount > 0:
		description = "Draw "
	else:
		description += "Discard "
	for i in range(abs(amount)):
		description += generate_bbcode_icon_string("draw")
	return description

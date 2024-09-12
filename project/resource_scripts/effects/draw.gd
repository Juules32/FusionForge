extends Effect
class_name DrawEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, _target: Creature) -> void:
	for i in range(amount):
		Game.draw_card()
	print("Drew " + str(amount) + " cards")
	
func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var description := "Draw " if amount > 0 else "Discard "
	for i in range(abs(amount)):
		description += Utils.generate_bbcode_icon_string("draw")
	return description

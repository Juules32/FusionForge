extends Effect
class_name ShockEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	print("Applied " + str(amount) + " shock")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return str(amount_to_percentage(amount)) + "% chance enemy won't move on its next turn"

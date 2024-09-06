extends Effect
class_name ShockEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	target.apply_shock(amount)
	print("Applied " + str(amount) + " shock")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var percent_string := float_to_percent(amount_to_float(amount))
	return percent_string + " chance enemy won't move next turn"

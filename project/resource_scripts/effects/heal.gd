extends Effect
class_name HealEffect

func resolve(_user_element: Data.ELEMENTS, source: Creature, _target: Creature) -> void:
	source.current_health += amount
	print("Healed/payed " + str(amount) + " life")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	if amount > 0:
		return "Heals player " + generate_bbcode_color_string("red", str(amount)) + generate_bbcode_icon_string("heal")
	else:
		return "Pay " + generate_bbcode_color_string("red", str(abs(amount))) + generate_bbcode_icon_string("heal")

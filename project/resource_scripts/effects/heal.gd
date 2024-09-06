extends Effect
class_name HealEffect

func resolve(_user_element: Data.ELEMENTS, source: Creature, _target: Creature) -> void:
	source.apply_heal(amount)
	print("Healed/paid " + str(amount) + " life")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var description_start := "Heals player " if amount > 0 else "Pay "
	var red_amount := generate_bbcode_color_string("red", str(abs(amount)))
	var heal_icon := generate_bbcode_icon_string("heal")
	return description_start + red_amount + heal_icon

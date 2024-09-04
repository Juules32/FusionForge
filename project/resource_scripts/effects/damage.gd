extends Effect
class_name DamageEffect

func resolve(user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	var calculated_amount := apply_weakness_or_resistance(user_element, target)
	target.current_health -= calculated_amount
	print("Dealt " + str(calculated_amount) + " damage to " + target.name)

func get_description(user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, target: Creature = null) -> String:
	var calculated_amount := apply_weakness_or_resistance(user_element, target)
	var target_name := get_target_name(target)
	var red_text := generate_bbcode_color_string("red", str(calculated_amount))
	var icon := generate_bbcode_icon_string("damage")
	return red_text + icon + " to " + target_name

func apply_weakness_or_resistance(source_element: Data.ELEMENTS, target: Creature) -> int:
	if target:
		if target.element in Data.element_strengths[source_element]:
			return amount * 2
		elif target.element in Data.element_weaknesses[source_element]:
			return ceil(float(amount) / 2)
	return amount

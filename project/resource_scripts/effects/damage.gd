extends Effect
class_name DamageEffect

func resolve(user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	var calculated_amount := apply_weakness_or_resistance(user_element, target)
	target.apply_damage(calculated_amount)
	print("Dealt " + str(calculated_amount) + " damage to " + target.name)

func get_description(user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, target: Creature = null) -> String:
	var calculated_amount := apply_weakness_or_resistance(user_element, target)
	var target_name := get_target_name(target)
	var red_text := Utils.generate_bbcode_color_string("red", str(calculated_amount))
	var icon := Utils.generate_bbcode_icon_string("damage")
	return red_text + icon + " to " + target_name

func get_intent(user: Enemy, target := Game.state.run.battle.player) -> String:
	var calculated_amount := apply_weakness_or_resistance(user.element, target)
	var icon := Utils.generate_bbcode_icon_string("damage")
	return str(calculated_amount) + icon

func get_intent_description(user: Enemy, target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("damage")
	var calculated_amount := apply_weakness_or_resistance(user.element, target)
	var base = user.name.capitalize() + " intends to deal " + str(amount) + icon + " damage to you. "
	var clarification := ""
	if not calculated_amount == amount:
		var weak_or_resist := "You are weak to " if calculated_amount > amount else "You resist "
		clarification = "(" + weak_or_resist + Data.element2str[user.element].capitalize() + ")."
	return base + clarification

func apply_weakness_or_resistance(source_element: Data.ELEMENTS, target: Creature) -> int:
	if target:
		if target.element in Data.element_strengths[source_element]:
			return amount * 2
		elif target.element in Data.element_weaknesses[source_element]:
			return ceil(float(amount) / 2)
	return amount

extends Effect
class_name ShockEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	target.apply_shock(amount)
	print("Applied " + str(amount) + " shock")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var percent_string := float_to_percent(amount_to_float(amount))
	return percent_string + " chance enemy won't move next turn"

func get_intent(user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("shock")
	return str(amount) + icon

func get_intent_description(user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("shock")
	return user.name.capitalize() + " intends to deal " + str(amount) + icon + " shock to you."

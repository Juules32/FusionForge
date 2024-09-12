extends Effect
class_name StrengthEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	target.apply_strength(amount)
	print("Applied " + str(amount) + " strength/weakness")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var damage_icon := Utils.generate_bbcode_icon_string("damage")
	return "Target will deal " + str(abs(amount)) + " " + ("more" if amount > 0 else "less") + damage_icon + " next turn"

func get_intent(_user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("strength" if amount > 0 else "weakness")
	return str(abs(amount)) + icon

func get_intent_description(user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("damage")
	var more_or_less := "more" if amount > 0 else "less"
	return user.name.capitalize() + " intends to make you deal " + str(abs(amount)) + icon + " " + more_or_less + " damage next turn."

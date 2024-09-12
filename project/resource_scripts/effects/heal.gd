extends Effect
class_name HealEffect

func resolve(_user_element: Data.ELEMENTS, source: Creature, _target: Creature) -> void:
	source.apply_heal(amount)
	print("Healed/paid " + str(amount) + " life")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var description_start := "Heals player " if amount > 0 else "Pay "
	var red_amount := Utils.generate_bbcode_color_string("red", str(abs(amount)))
	var icon := Utils.generate_bbcode_icon_string("heal")
	return description_start + red_amount + icon

func get_intent(_user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("heal")
	return str(amount) + icon

func get_intent_description(user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("heal")
	var heal_or_pay = "heal" if amount > 0 else "pay"
	return user.name.capitalize() + " intends to " + heal_or_pay + " " + str(amount) + icon + "."

extends Effect
class_name ShieldEffect

func resolve(_user_element: Data.ELEMENTS, source: Creature, _target: Creature) -> void:
	source.apply_shield(amount)
	print("Granted " + str(amount) + " shield")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return str(amount) + Utils.generate_bbcode_icon_string("shield") + " to player"

func get_intent(_user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("shield")
	return str(amount) + icon

func get_intent_description(user: Enemy, _target := Game.state.run.battle.player) -> String:
	var icon := Utils.generate_bbcode_icon_string("shield")
	return user.name.capitalize() + " intends to shield for " + str(amount) + icon + "."

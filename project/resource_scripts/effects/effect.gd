# -----------------------------------------------------------------------------
# Resource script for the parent class of all damage effects.
# ----------------------------------------------------------------------------

extends ProperResource
class_name Effect

@export var amount: int

func resolve(_user_element: Data.ELEMENTS, _source: Creature, _target: Creature) -> void:
	print("Template effect resolve")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return "Template effect description"

func get_intent(_user: Enemy, _target := Game.state.run.battle.player) -> String:
	return "Template"

func get_intent_description(_user: Enemy, _target := Game.state.run.battle.player) -> String:
	return "Template intent description"

# Used to convert effect amount to logarithmic percentage to prevent unfair effects
func amount_to_float(x: int, upper_limit: float = 0.5, steepness: float = 0.2) -> float:
	var result := (2*upper_limit / (1 + exp(-steepness * x))) - upper_limit
	result = clamp(result, 0.0, upper_limit)
	return result

func float_to_percent(number: float) -> String:
	return str(round(number * 100)) + "%"

func get_target_name(target: Creature) -> String:
	if target:
		return target.name.capitalize()
	return "target"

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

# Various util functions ⬇

func get_icon_path(effect_name: String) -> String:
	return "res://assets/icons/effects/" + effect_name + ".png"

func generate_bbcode_color_string(color: String, text: String) -> String:
	return "[color=" + color + "]" + text + "[/color]"

func generate_bbcode_icon_string(effect_name: String) -> String:
	return "[img=top]res://assets/icons/effects/" + effect_name + ".png[/img]"

# Used to convert effect amount to logarithmic percentage to prevent unfair effects
func amount_to_percentage(x: int, upper_limit: float = 0.5, steepness: float = 0.2) -> int:
	var result := (2*upper_limit / (1 + exp(-steepness * x))) - upper_limit
	result = clamp(result, 0.0, 0.5)
	return round(result * 100)

func get_target_name(target: Creature) -> String:
	if target:
		return target.name.capitalize()
	return "target"

# -----------------------------------------------------------------------------
# Resource script for the parent class of all damage effects.
# ----------------------------------------------------------------------------

extends Resource
class_name Effect

@export var amount: int

func resolve(_target: Enemy = null) -> void:
	print("Template effect resolve")

func get_description() -> String:
	return "Template effect description"

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

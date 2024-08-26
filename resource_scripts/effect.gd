# -----------------------------------------------------------------------------
# Resource script for the parent class of all damage effects.
# ----------------------------------------------------------------------------

extends Resource
class_name Effect

var name: String = "effect"

func resolve(_target = null) -> void:
	print("Template effect resolve.")

func get_description() -> String:
	return "Template effect description."

func get_icon_path() -> String:
	return "res://assets/icons/effects/" + name + ".png"

func generate_bbcode_color_string(color: String, text: String) -> String:
	return "[color=" + color + "]" + text + "[/color]"

func generate_bbcode_icon_string(icon_name: String) -> String:
	return "[img=top]res://assets/icons/effects/" + icon_name + ".png[/img]"

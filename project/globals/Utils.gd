extends Node

# Various util functions ⬇

func get_icon_path(effect_name: String) -> String:
	return "res://assets/icons/effects/" + effect_name + ".png"

func generate_bbcode_color_string(color: String, text: String) -> String:
	return "[color=" + color + "]" + text + "[/color]"

func generate_bbcode_icon_string(effect_name: String) -> String:
	return "[img=top]res://assets/icons/effects/" + effect_name + ".png[/img]"

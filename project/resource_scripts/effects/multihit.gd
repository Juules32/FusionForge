# WIP

extends Effect
class_name MultihitEffect

func resolve(target: Enemy = null) -> void:
	print("Multihit effect resolve")

func get_description() -> String:
	return "Multihit: " + generate_bbcode_icon_string("damage") + " ALL enemies"

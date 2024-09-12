# WIP

extends Effect
class_name MultihitEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, _target: Creature) -> void:
	print("Multihit effect resolve")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return "Multihit: " + Utils.generate_bbcode_icon_string("damage") + " ALL enemies"

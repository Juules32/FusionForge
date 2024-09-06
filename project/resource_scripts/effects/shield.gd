extends Effect
class_name ShieldEffect

func resolve(_user_element: Data.ELEMENTS, source: Creature, _target: Creature) -> void:
	source.apply_shield(amount)
	print("Granted " + str(amount) + " shield")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return str(amount) + generate_bbcode_icon_string("shield") + " to player"

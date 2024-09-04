extends Effect
class_name ShieldEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	print("Granted " + str(amount) + " shield")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	return str(amount) + generate_bbcode_icon_string("shield") + " to player"

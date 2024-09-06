extends Effect
class_name StrengthEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, target: Creature) -> void:
	target.apply_strength(amount)
	print("Applied " + str(amount) + " strength/weakness")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var damage_icon := generate_bbcode_icon_string("damage")
	return "Target will deal " + str(abs(amount)) + " " + ("more" if amount > 0 else "less") + damage_icon + " next turn"

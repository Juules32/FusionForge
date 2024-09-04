extends Effect
class_name StrengthEffect

func resolve(_user_element: Data.ELEMENTS, _source: Creature, _target: Creature) -> void:
	print("Applied " + str(amount) + " strength/weakness")

func get_description(_user_element: Data.ELEMENTS = Data.ELEMENTS.NONE, _target: Creature = null) -> String:
	var less_or_more := "less"
	if amount > 0:
		less_or_more = "more"
	return "Target will deal " + str(abs(amount)) + " " + less_or_more + generate_bbcode_icon_string("damage") + " next turn"

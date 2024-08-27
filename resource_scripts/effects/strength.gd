extends Effect
class_name StrengthEffect

func resolve(target: Enemy = null) -> void:
	print("Applied " + str(amount) + " strength/weakness")

func get_description() -> String:
	var less_or_more := "less"
	if amount > 0:
		less_or_more = "more"
	return "Target will deal " + str(abs(amount)) + " " + less_or_more + generate_bbcode_icon_string("damage") + " next turn"

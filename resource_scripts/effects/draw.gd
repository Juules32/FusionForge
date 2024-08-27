extends Effect
class_name DrawEffect

func resolve(target: Enemy = null) -> void:
	print("Drew " + str(amount) + " cards")
	
func get_description() -> String:
	var description: String
	if amount > 0:
		description = "Draw "
	else:
		description += "Discard "
	for i in range(abs(amount)):
		description += generate_bbcode_icon_string("draw")
	return description

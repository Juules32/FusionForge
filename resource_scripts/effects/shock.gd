extends Effect
class_name ShockEffect

func resolve(target: Enemy = null) -> void:
	print("Applied " + str(amount) + " shock")

func get_description() -> String:
	return str(amount_to_percentage(amount)) + "% chance enemy won't move on its next turn"

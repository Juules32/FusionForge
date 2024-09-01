extends Effect
class_name HealEffect

func resolve(_target: Enemy = null) -> void:
	print("Healed/payed " + str(amount) + " life")

func get_description() -> String:
	if amount > 0:
		return "Heals player " + generate_bbcode_color_string("red", str(amount)) + generate_bbcode_icon_string("heal")
	else:
		return "Pay " + generate_bbcode_color_string("red", str(abs(amount))) + generate_bbcode_icon_string("heal")

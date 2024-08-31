extends Effect
class_name ShieldEffect

func resolve(target: Enemy = null) -> void:
	print("Granted " + str(amount) + " shield")

func get_description() -> String:
	return str(amount) + generate_bbcode_icon_string("shield") + " to player"

extends Effect
class_name DamageEffect

func resolve(target: Enemy = null) -> void:
	print("Dealt " + str(amount) + " damage to " + target.name)
	target.hit_points -= amount

func get_description() -> String:
	return generate_bbcode_color_string("red", str(amount)) + generate_bbcode_icon_string("damage") + " to a target"

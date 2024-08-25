extends Effect
class_name DamageEffect

@export var damage_count: int

func _ready() -> void:
	name = "damage"

func get_description() -> String:
	return generate_bbcode_color_string("red", str(damage_count)) + generate_bbcode_icon_string("damage") + " to a target."

func resolve(target = null) -> void:
	print("dealt " + str(damage_count) + " damage to " + str(target))

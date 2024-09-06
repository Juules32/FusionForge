extends ProperResource
class_name Creature

@export var name: String
@export var current_health: int = 50
@export var max_health: int = 50
@export var element: Data.ELEMENTS = Data.ELEMENTS.NONE
@export var shield_amount: int
@export var strength_amount: int
@export var shock_amount: int

func apply_damage(amount: int) -> void:
	current_health -= amount
	current_health = max(0, current_health)

func apply_heal(amount: int) -> void:
	current_health += amount

func apply_shield(amount: int) -> void:
	shield_amount += amount

func apply_strength(amount: int) -> void:
	strength_amount += amount

func apply_shock(amount: int) -> void:
	shock_amount += amount

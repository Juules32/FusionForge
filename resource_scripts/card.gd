# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to cards.
# ----------------------------------------------------------------------------

extends Resource
class_name Card

@export var id: int
@export var name: String
@export var effects: Array[Effect]
@export var element: ElementData.ELEMENTS
@export var targets_single_enemy: bool

func add_effect(effect: Effect) -> void:
	effects.append(effect)

func set_element(new_element: ElementData.ELEMENTS) -> void:
	element = new_element

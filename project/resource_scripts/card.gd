# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to cards.
# ----------------------------------------------------------------------------

extends ProperResource
class_name Card

@export var name: String
@export var effects: Array[Effect]
@export var element: Data.ELEMENTS

func add_effect(effect: Effect) -> void:
	effects.append(effect)

func set_element(new_element: Data.ELEMENTS) -> void:
	element = new_element

func targets_single_enemy() -> bool:
	return true # Make more sophisticated

func play(target: Creature) -> void:
	Game.state.run.battle.player.element = element
	for effect in effects:
		effect.resolve(element, Game.state.run.battle.player, target)

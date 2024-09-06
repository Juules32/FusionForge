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

func targets_single_creature() -> bool:
	var targeting_effects := [DamageEffect, ShockEffect, StrengthEffect]
	for effect in effects:
		for effect_type in targeting_effects:
			if is_instance_of(effect, effect_type):
				return true
	return false

func play(target: Creature) -> void:
	Game.state.run.battle.player.element = element
	for effect in effects:
		effect.resolve(element, Game.state.run.battle.player, target)

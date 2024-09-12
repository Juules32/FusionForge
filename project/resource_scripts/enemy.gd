extends Creature
class_name Enemy

@export var attack_pattern: Array[Effect]
@export var next_attack_index := 0
@export_multiline var description: String

func resolve_intent() -> void:
	var intent := attack_pattern[next_attack_index]
	intent.resolve(element, self, Game.state.run.battle.player)
	increment_intent_index()

# iii :O
func increment_intent_index() -> void:
	next_attack_index += 1
	if next_attack_index >= len(attack_pattern):
		next_attack_index = 0

extends RichTextLabel

@onready var enemy: EnemyBody = $".."



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = ""
	if not enemy.data:
		return
	
	if not enemy.data.attack_pattern:
		return
	
	var next_intent := enemy.data.attack_pattern[enemy.data.next_attack_index]
	var intent_str := next_intent.get_intent(enemy.data)
	text = "[center]" + intent_str + "[/center]"

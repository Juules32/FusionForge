extends MarginContainer

@onready var enemy_area: EnemyArea = $"../../BattleArea/EnemyCenterer/EnemyArea"
@onready var enemy_name_label: Label = $EnemyInformation/EnemyNameLabel
@onready var enemy_texture: TextureRect = $EnemyInformation/EnemyTexture
@onready var enemy_status: RichTextLabel = $EnemyInformation/EnemyStatus
@onready var enemy_intent: RichTextLabel = $EnemyInformation/EnemyIntent
@onready var enemy_description: RichTextLabel = $EnemyInformation/EnemyDescription

func _process(delta: float) -> void:
	if not enemy_area.selected_enemy:
		enemy_intent.text = "No enemy selected."
		return
	
	var enemy_data = enemy_area.selected_enemy.data
	var next_intent = enemy_data.attack_pattern[enemy_data.next_attack_index]
	
	enemy_name_label.text = enemy_data.name.capitalize()
	enemy_texture.texture = enemy_area.selected_enemy.sprite.texture
	enemy_intent.text = next_intent.get_intent_description(enemy_data)
	enemy_description.text = enemy_data.description

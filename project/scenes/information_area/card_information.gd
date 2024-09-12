# -----------------------------------------------------------------------------
# Manages what card should be shown
# ----------------------------------------------------------------------------

extends VBoxContainer

@onready var card_name_label: Label = $CardNameLabel
@onready var card_texture: TextureRect = $CardTexture
@onready var effect_description: RichTextLabel = $EffectDescription
@onready var hand_area: HandArea = $"../../CardArea/HandCenterer/HandArea"
@onready var enemy_area: EnemyArea = $"../../BattleArea/EnemyCenterer/EnemyArea"

func _process(_delta: float) -> void:
	var description_text := ""
	if not hand_area.selected_card:
		effect_description.text = "No card selected."
		return
		
	card_name_label.text = hand_area.selected_card.card_data.name.capitalize()
	card_texture.texture = hand_area.selected_card.sprite.texture
	for effect: Effect in hand_area.selected_card.card_data.effects:
		var current_card_element := hand_area.selected_card.card_data.element
		var current_enemy := enemy_area.selected_enemy.data if enemy_area.selected_enemy else null
		description_text += effect.get_description(current_card_element, current_enemy) + "\n"
	effect_description.text = description_text

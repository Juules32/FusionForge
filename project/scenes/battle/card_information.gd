# -----------------------------------------------------------------------------
# Manages what card should be shown
# ----------------------------------------------------------------------------

extends VBoxContainer

@onready var card_name_label: Label = $CardNameLabel
@onready var effect_description: RichTextLabel = $EffectDescription
@onready var hand_area: HandArea = $"../../CardArea/HandCenterer/HandArea"
@onready var enemy_area: EnemyArea = $"../../BattleArea/EnemyCenterer/EnemyArea"


func _ready() -> void:
	effect_description.scroll_active = false

func _process(_delta: float) -> void:
	var selected_card: CardBody = $"../../CardArea/HandCenterer/HandArea".selected_card
	var description_text := ""
	if selected_card:
		card_name_label.text = selected_card.card_data.name.capitalize()
		for effect: Effect in selected_card.card_data.effects:
			var current_card_element := Data.ELEMENTS.NONE
			if hand_area.selected_card:
				current_card_element = hand_area.selected_card.card_data.element
			var current_enemy: Enemy = null
			if enemy_area.selected_enemy:
				current_enemy = enemy_area.selected_enemy.enemy_data
			description_text += effect.get_description(current_card_element, current_enemy) + "\n"
		effect_description.text = description_text
	else:
		effect_description.text = "No card selected."

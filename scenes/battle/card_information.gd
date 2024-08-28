# -----------------------------------------------------------------------------
# Manages what card should be shown
# ----------------------------------------------------------------------------

extends VBoxContainer

@onready var card_name_label: Label = $CardNameLabel
@onready var effect_description: RichTextLabel = $EffectDescription

func _ready() -> void:
	effect_description.scroll_active = false

func _process(_delta: float) -> void:
	var selected_card: CardBody = $"../../CardArea/HandCenterer/HandArea".selected_card
	var description_text := ""
	if selected_card:
		card_name_label.text = selected_card.card_data.name.capitalize()
		for effect: Effect in selected_card.card_data.effects:
			description_text += effect.get_description() + "\n"
		effect_description.text = description_text
	else:
		effect_description.text = "No card selected."

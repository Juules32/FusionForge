# -----------------------------------------------------------------------------
# Manages what card should be shown
# ----------------------------------------------------------------------------

extends VBoxContainer

@onready var label: RichTextLabel = $EffectDescription

func _ready() -> void:
	label.scroll_active = false

func _process(delta: float) -> void:
	var selected_card: CardBody = $"../../CardArea/HandCenterer/HandArea".selected_card
	var description_text: String = ""
	if selected_card:
		for effect: Effect in selected_card.card_data.effects:
			description_text += effect.get_description() + "\n"
		label.text = description_text
	else:
		label.text = "No card selected."

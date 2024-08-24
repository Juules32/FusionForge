# -----------------------------------------------------------------------------
# Manages what information should be shown.
# -----------------------------------------------------------------------------

extends Control

@onready var hand_area: HandArea = $"../CardArea/HandCenterer/HandArea"
@onready var element_information: VBoxContainer = $ElementInformation
@onready var card_information: VBoxContainer = $CardInformation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_show_relevant_information()

func _show_relevant_information() -> void:
	if hand_area.selected_card:
		card_information.visible = true
		element_information.visible = false
	else:
		card_information.visible = false
		element_information.visible = true

# -----------------------------------------------------------------------------
# Manages what information should be shown.
# -----------------------------------------------------------------------------

extends Control

@onready var hand_area: HandArea = $"../CardArea/HandCenterer/HandArea"
@onready var enemy_area: EnemyArea = $"../BattleArea/EnemyCenterer/EnemyArea"
@onready var element_information: VBoxContainer = $ElementInformation
@onready var card_information: VBoxContainer = $CardInformation
@onready var enemy_information: VBoxContainer = $EnemyInformation

func _process(_delta: float) -> void:
	_show_relevant_information()

func _show_relevant_information() -> void:
	if hand_area.selected_card:
		element_information.visible = false
		card_information.visible = true
		enemy_information.visible = false
	elif enemy_area.selected_enemy:
		element_information.visible = false
		card_information.visible = false
		enemy_information.visible = true
	else:
		element_information.visible = true
		card_information.visible = false
		enemy_information.visible = false

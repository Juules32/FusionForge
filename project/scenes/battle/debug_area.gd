# -----------------------------------------------------------------------------
# Manages various debugging options.
# -----------------------------------------------------------------------------

extends VBoxContainer
@onready var hand_area: HandArea = $"../CardArea/HandCenterer/HandArea"
@onready var deck_area: Control = $"../CardArea/DeckCenterer/DeckArea"
@onready var card_back_selector: OptionButton = $HFlowContainer/CardBackSelector
@onready var label: Label = $Label
@onready var enemy_area: HBoxContainer = $"../BattleArea/EnemyCenterer/EnemyArea"
@onready var window_mode_selector: OptionButton = $HFlowContainer/WindowModeSelector

@export var example_battle: Battle

func _ready() -> void:
	# visible = OS.is_debug_build() # Use to hide debugging from non-debug builds
	
	var card_back_index = card_back_selector.get_item_index(Game.state.options.card_back)
	card_back_selector.selected = card_back_index
	var window_mode_index = window_mode_selector.get_item_index(Game.state.options.window_mode)
	window_mode_selector.selected = window_mode_index
	
func _process(_delta: float) -> void:
	# Show any kind of information here for debugging
	if enemy_area.selected_enemy:
		label.text = enemy_area.selected_enemy.enemy_data.name
	else:
		label.text = ""

func _on_draw_button_down() -> void:
	if len(Game.state.run.battle.deck) > 0:
		# Remove card from deck
		var drawn_card = Game.state.run.battle.deck[randi() % len(Game.state.run.battle.deck)]
		# ...
		
		# Add card to hand
		Game.state.run.battle.hand.append(drawn_card)
		hand_area.draw_card(drawn_card)
	else:
		print("No cards in deck")

func _on_load_template_button_down() -> void:
	Game.state.run.battle = example_battle.proper_duplicate(true)
	get_tree().reload_current_scene()

func _on_save_button_down() -> void:
	Game.save_state()

func _on_button_item_selected(index: int) -> void:
	var card_back = card_back_selector.get_item_id(index) as Data.CARDBACKS
	Game.state.options.card_back = card_back
	deck_area.load_card_back(card_back)

func _on_window_mode_selector_item_selected(index: int) -> void:
	var window_mode = window_mode_selector.get_item_id(index) as DisplayServer.WindowMode
	Game.state.options.window_mode = window_mode
	DisplayServer.window_set_mode(window_mode)

func _on_reload_button_down() -> void:
	Game.load_state()
	get_tree().reload_current_scene()

func _on_reset_button_down() -> void:
	Game.state = State.new()
	get_tree().reload_current_scene()

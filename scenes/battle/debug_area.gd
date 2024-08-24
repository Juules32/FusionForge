# -----------------------------------------------------------------------------
# Manages various debugging options.
# -----------------------------------------------------------------------------

extends VBoxContainer

@onready var hand_area: HandArea = $"../UserInterface/CardArea/HandCenterer/HandArea"

func _process(delta: float) -> void:
	$Label.text = str(len(Game.state.run.battle.hand)) + "\n" 
	if len(Game.state.run.battle.hand) > 0:
		$Label.text += ElementData.int2str[Game.state.run.battle.hand[0].element]

func _get_random_element() -> int:
	var i = randi() % len(ElementData.ELEMENTS)
	return i

func _on_draw_button_down() -> void:
	var new_card_data = Card.new() # This should instead be drawn from the deck
	
	# This is how to load predefined cards:
	# ResourceLoader.load("res://resources/lightning_bolt.tres") 
	
	new_card_data.element = _get_random_element()
	Game.state.run.battle.hand.append(new_card_data)
	hand_area.draw_card(new_card_data)

func _on_reset_state_button_down() -> void:
	Game.state = State.new()
	for card in hand_area.get_children():
		card.free()

func _on_save_button_down() -> void:
	Game._save_state()

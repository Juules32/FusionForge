# -----------------------------------------------------------------------------
# Manages various debugging options.
# -----------------------------------------------------------------------------

# A lot of this stuff should later be moved to the big "battle.gd" script

extends VBoxContainer

@onready var hand_area: HandArea = $"../UserInterface/CardArea/HandCenterer/HandArea"

func _ready() -> void:
	for card: Card in Game.state.run.battle.hand:
		hand_area.draw_card(card)
	
func _process(delta: float) -> void:
	$Label.text = str(len(Game.state.run.battle.hand)) + "\n" 
	if len(Game.state.run.battle.hand) > 0:
		$Label.text += ElementData.int2str[Game.state.run.battle.hand[0].element]

func _get_random_element() -> int:
	var i = randi() % len(ElementData.ELEMENTS)
	return i

func _on_draw_button_down() -> void:
	
	if len(Game.state.run.battle.deck) > 0:
		var drawn_card = Game.state.run.battle.deck[randi() % len(Game.state.run.battle.deck)]
		
		# Remove card from deck
		
		# Add card to hand
		Game.state.run.battle.hand.append(drawn_card)
		hand_area.draw_card(drawn_card)
	else:
		print("no cards in deck")
	# This is how to load predefined cards:
	

func _on_reset_state_button_down() -> void:
	#Game.state = State.new()
	Game.state.run.battle = ResourceLoader.load("res://resources/example_battle.tres").duplicate(true)
	for card in hand_area.get_children():
		card.free()
	for card in Game.state.run.battle.hand:
		hand_area.draw_card(card)

func _on_save_button_down() -> void:
	Game.save_state()

func _on_play_button_down() -> void:
	if len(hand_area.get_children()) > 0:
		var card: CardBody = hand_area.get_child(0)
		for effect: Effect in card.card_data.effects:
			effect.resolve()

extends Control

const card_width = 26
const card_height = 40
const max_hand_width = 170.0 - card_width
const hover_height = 10

var max_space_between_cards = 30
var hovered_card: Card # Current hovered card
var dragged_card: Card # Current dragged card
var clicked_card: Card # Current clicked card
var selected_card: Card # Card shown to the right
var mouse_pressed: bool

@onready var card_scene: PackedScene = load("res://scenes/card/card.tscn")

func _process(delta: float) -> void:
	mouse_pressed = Input.is_action_pressed("left_mouse")
	_determine_clicked_card()
	_update_debug_text()
	_update_dragged_card_position(delta)
	selected_card = _determine_selected_card()

# If mouse is clicked outside a card, clicked card is set to null
func _determine_clicked_card() -> void:
	if Input.is_action_just_pressed("left_mouse"):
		clicked_card = null
		var mouse_coords = get_global_mouse_position()
		for card in get_children():
			if card.get_global_rect().has_point(mouse_coords):
				clicked_card = card
				return

# For debugging. Will be deleted/changed later
func _update_debug_text() -> void:
	if hovered_card:
		$"../../DeckCenterer/LabelContainer/HoveredLabel".text = str(hovered_card)
	else:
		$"../../DeckCenterer/LabelContainer/HoveredLabel".text = "null"
	if clicked_card:
		$"../../DeckCenterer/LabelContainer/ClickedLabel".text = str(clicked_card)
	else:
		$"../../DeckCenterer/LabelContainer/ClickedLabel".text = "null"
	if selected_card:
		$"../../DeckCenterer/LabelContainer/SelectedLabel".text = str(selected_card)
	else:
		$"../../DeckCenterer/LabelContainer/SelectedLabel".text = "null"

# Positions card slightly behind the mouse position
func _update_dragged_card_position(delta: float) -> void:
	if hovered_card and hovered_card.button_pressed:
		var mouse_position = get_viewport().get_mouse_position()
		var target_x = mouse_position[0] - card_width/2
		var target_y = mouse_position[1] - card_height/2
		var target_position = Vector2(target_x, target_y)
		var distance_between_mouse_and_card = target_position.distance_squared_to(
			hovered_card.get_global_rect().position)
		var speed = delta * distance_between_mouse_and_card * 0.7
		hovered_card.set_global_position(
			hovered_card.get_global_rect().position.move_toward(
				target_position, speed))

# Algorithm prioritizing which card should be selected
func _determine_selected_card() -> Card:
	if dragged_card:
		return dragged_card
	if hovered_card:
		return hovered_card
	if clicked_card:
		return clicked_card
	return null

func draw_card() -> void:
	_setup_card()
	_update_card_positions()

# Sets up signals for a new instantiated card and adds it to the HandArea
func _setup_card() -> void:
	var new_card: Card = card_scene.instantiate()
	new_card.mouse_entered.connect(_on_card_hovered.bind(new_card))
	new_card.mouse_exited.connect(_on_card_exited.bind(new_card))
	new_card.button_down.connect(_on_card_pressed.bind(new_card))
	new_card.button_up.connect(_on_card_released.bind(new_card))
	add_child(new_card)

# Repositions the hand, taking into account the current dragged card
func _update_card_positions() -> void:
	var non_dragged_cards = get_children().filter(func(card): return card != dragged_card)
	var space_between_cards = max_hand_width / non_dragged_cards.size()
	var card_x_positions = _distribute_cards(non_dragged_cards.size(), space_between_cards)
	for i in range(non_dragged_cards.size()):
		non_dragged_cards[i].move_horizontally(card_x_positions[i] - card_width / 2)

func _distribute_cards(n: int, spacing: float) -> Array:
	var positions = []
	if n % 2 == 1:
		var mid_index: int = n / 2
		for i in range(n):
			var x_position = (i - mid_index) * spacing
			positions.append(x_position)
	else:
		var mid_index: int = n / 2
		for i in range(n):
			var x_position = (i - mid_index + 0.5) * spacing
			positions.append(x_position)
	return positions

# Triggers when the mouse enters a card
func _on_card_hovered(card: Card):
	if not mouse_pressed:
		card.z_index = 1
		card.move_vertically(card.y - hover_height)
		hovered_card = card

# Triggers when the mouse exits a card
func _on_card_exited(card):
	if not mouse_pressed:
		card.z_index = 0
		card.move_vertically(card.y)
		if hovered_card == card:
			hovered_card = null

# Triggers when a card is pressed down
func _on_card_pressed(card: Card):
	card.z_index = 1
	dragged_card = hovered_card
	clicked_card = hovered_card
	_update_card_positions()

# Triggers when a card is released
func _on_card_released(card):
	card.z_index = 0
	dragged_card = null
	hovered_card = null
	card.move_vertically(card.y, 0.5)
	_update_card_positions()

func _on_battle_area_mouse_entered() -> void:
	print("entered mouse area")
	if hovered_card:
		pass # Implement sending signal to play card

func _on_button_button_down() -> void:
	draw_card()

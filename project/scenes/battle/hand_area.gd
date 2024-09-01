# -----------------------------------------------------------------------------
# Manages which card is selected, card positioning and movement, etc.
# -----------------------------------------------------------------------------

extends Control
class_name HandArea

const card_width = 26
const card_height = 40
const max_hand_width = 170.0 - card_width
const hover_height = 10

var max_space_between_cards = 30
var selected_card: CardBody # Card shown to the right
var mouse_pressed: bool
var space_between_cards = max_space_between_cards
var non_dragged_cards: Array

@onready var enemy_area: HBoxContainer = $"../../../BattleArea/EnemyCenterer/EnemyArea"
@onready var battle_area: Control = $"../../../BattleArea"

const card_scene: PackedScene = preload("res://scenes/card/card.tscn")

func _ready() -> void:
	for card: Card in Game.state.run.battle.hand:
		draw_card(card)

func _process(delta: float) -> void:
	mouse_pressed = Input.is_action_pressed("left_mouse")
	_update_dragged_card_position(delta)
	_update_selected_indicator_visibility()

# Positions card slightly behind the mouse position
func _update_dragged_card_position(delta: float) -> void:
	if selected_card and selected_card.button.button_pressed:
		var mouse_position = get_viewport().get_mouse_position()
		var target_x = mouse_position[0]
		var target_y = mouse_position[1]
		var target_position = Vector2(target_x, target_y)
		var distance_between_mouse_and_card = target_position.distance_squared_to(
			selected_card.get_global_rect().position)
		var speed = delta * distance_between_mouse_and_card * 0.7
		selected_card.set_global_position(
			selected_card.get_global_rect().position.move_toward(
				target_position, speed))

func draw_card(card_data: Card) -> void:
	_setup_card(card_data)
	_update_card_positions()

func _update_selected_indicator_visibility() -> void:
	for card: CardBody in get_children():
		card.selected_indicator_sprite.visible = false
	if selected_card:
		selected_card.selected_indicator_sprite.visible = true

# Sets up signals for a new instantiated card and adds it to the HandArea
func _setup_card(card_data: Card) -> void:
	var new_card: CardBody = card_scene.instantiate()
	new_card.card_data = card_data
	add_child(new_card)
	# Sprite is set after adding as child because sprite node inits onready
	new_card.determine_and_set_sprite()
	new_card.button.mouse_entered.connect(_on_card_hovered.bind(new_card))
	new_card.button.mouse_exited.connect(_on_card_exited.bind(new_card))
	new_card.button.button_down.connect(_on_card_pressed.bind(new_card))
	new_card.button.button_up.connect(_on_card_released.bind(new_card))
	
# Repositions the hand, taking into account the current dragged card
func _update_card_positions() -> void:
	non_dragged_cards = get_children().filter(func(card): return card != selected_card)
	space_between_cards = min(max_hand_width / non_dragged_cards.size(), max_space_between_cards)
	var card_x_positions = _distribute_cards(non_dragged_cards.size())
	for i in range(non_dragged_cards.size()):
		non_dragged_cards[i].move_horizontally(card_x_positions[i])

# Returns a list of x coords for the cards of the hand
func _distribute_cards(n: int) -> Array:
	var positions = []
	if n % 2 == 1:
		var mid_index: int = n / 2
		for i in range(n):
			var x_position = (i - mid_index) * space_between_cards
			positions.append(x_position)
	else:
		var mid_index: int = n / 2
		for i in range(n):
			var x_position = (i - mid_index + 0.5) * space_between_cards
			positions.append(x_position)
	return positions

# Triggers when the mouse enters a card
func _on_card_hovered(card: CardBody):
	if not mouse_pressed:
		card.z_index = 2
		card.move_vertically(0 - hover_height)
		selected_card = card

# Triggers when the mouse exits a card
func _on_card_exited(card):
	if not mouse_pressed:
		card.z_index = 1
		card.move_vertically(0)
		if selected_card == card:
			selected_card = null

# Triggers when a card is pressed down
func _on_card_pressed(card: CardBody) -> void:
	card.z_index = 2
	_update_card_positions()

# Triggers when a card is released
func _on_card_released(card: CardBody) -> void:
	selected_card = null
	var is_played = card.play(enemy_area.selected_enemy)
	if not is_played:
		_set_dropped_card_index(card)
		card.z_index = 1
		card.move_vertically(0, 0.5)
		_update_card_positions()

func _set_dropped_card_index(card: CardBody) -> void:
	var card_x_positions = _distribute_cards(len(non_dragged_cards))
	var card_x = card.position.x
	var count = 0
	for x in card_x_positions:
		if card_x > x:
			count += 1
		else:
			break
	move_child(card, count)

func _on_battle_area_mouse_entered() -> void:
	if selected_card:
		pass # Implement showing arrow if card has targets instead of the card

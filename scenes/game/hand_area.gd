extends Control

const card_width = 26
const card_height = 40
var max_space_between_cards = 30
const max_hand_width = 170.0 - card_width
var hovered_card: Card = null
var selected_card: Card = null
var mouse_pressed: bool

@onready var card_scene: PackedScene = load("res://scenes/card/card.tscn")

func _process(delta: float) -> void:
	mouse_pressed = Input.is_action_pressed("left_mouse")
	if hovered_card and hovered_card.button_pressed:
		var mouse_position = get_viewport().get_mouse_position()
		var target_position = Vector2(mouse_position[0] - card_width/2, mouse_position[1] - card_height/2)
		#var distance_between_mouse_and_card = target_position.distance_squared_to(hovered_card.get_global_rect().position)
		#var speed = delta * distance_between_mouse_and_card * 0.7
		#hovered_card.set_global_position(hovered_card.get_global_rect().position.move_toward(target_position, speed))
		hovered_card.set_global_position(target_position)
		
func draw_card() -> void:
	_setup_card()
	_update_card_positions()

func _setup_card() -> void:
	var new_card: Card = card_scene.instantiate()
	new_card.mouse_entered.connect(_on_card_hovered.bind(new_card))
	new_card.mouse_exited.connect(_on_card_exited.bind(new_card))
	new_card.button_down.connect(_on_card_pressed.bind(new_card))
	new_card.button_up.connect(_on_card_released.bind(new_card))
	add_child(new_card)

func _update_card_positions() -> void:
	var cards = self.get_children()
	var space_between_cards = int(max_hand_width / len(cards))
	var card_x_positions = distribute_cards(len(cards), space_between_cards)
	for i in range(len(cards)):
		cards[i].move(card_x_positions[i] - card_width / 2)

func _on_card_hovered(card: Card):
	card.z_index = 1
	if not mouse_pressed:
		card.move_up(-30)
		hovered_card = card

func _on_card_exited(card):
	card.z_index = 0
	if not mouse_pressed:
		card.move_up(-20)
		if hovered_card == card:
			hovered_card = null
	
func _on_card_pressed(card: Card):
	card.z_index = 1

func _on_card_released(card):
	card.z_index = 0
	card.move_up(-20)
	_update_card_positions()

func distribute_cards(n: int, spacing: float) -> Array:
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

func _on_button_button_down() -> void:
	draw_card()

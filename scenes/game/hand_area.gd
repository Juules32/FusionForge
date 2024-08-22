extends Control

const card_width = 26
var max_space_between_cards = 30
const max_hand_width = 170.0 - card_width

@onready var card_scene: PackedScene = load("res://scenes/card/card.tscn")

func draw_card() -> void:
	_setup_card()
	_update_card_positions()

func _setup_card() -> void:
	var new_card: Card = card_scene.instantiate()
	new_card.mouse_entered.connect(_on_card_hovered.bind(new_card))
	new_card.button_down.connect(_on_card_clicked.bind(new_card))
	self.add_child(new_card)

func _update_card_positions() -> void:
	var cards = self.get_children()
	var space_between_cards = int(max_hand_width / len(cards))
	var card_x_positions = distribute_cards(len(cards), space_between_cards)
	for i in range(len(cards)):
		cards[i].move(card_x_positions[i] - card_width / 2)

func _on_card_hovered(option):
	print("card hovered!")

func _on_card_clicked(option):
	print("card clicked!")

func distribute_cards(n: int, spacing: float) -> Array:
	var positions := []
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

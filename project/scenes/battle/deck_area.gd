# -----------------------------------------------------------------------------
# Manages various visuals for the deck area.
# ----------------------------------------------------------------------------

extends Control

@onready var deck_hover_sprite: Sprite2D = $DeckHoverSprite
@onready var deck_sprite: Sprite2D = $DeckSprite

func _ready() -> void:
	load_card_back(Game.state.options.card_back)

func _on_mouse_entered() -> void:
	deck_hover_sprite.visible = true

func _on_mouse_exited() -> void:
	deck_hover_sprite.visible = false

func load_card_back(card_back: Data.CARDBACKS) -> void:
	deck_sprite.texture = load(generate_card_back_path(card_back))
	
func generate_card_back_path(card_back: Data.CARDBACKS) -> String:
	var path = "res://assets/cards/card_backs/"
	match card_back:
		Data.CARDBACKS.LOGO:
			path += "logo"
		Data.CARDBACKS.SYMMETRIC:
			path += "symmetric"
	path += ".png"
	return path

# -----------------------------------------------------------------------------
# Manages the visual aspects of cards.
# ----------------------------------------------------------------------------

extends Control
class_name CardBody

# Sets card data to default values
var card_data: Card = Card.new()

@onready var width: int = int(size[0])
@onready var height: int = int(size[1])
@onready var y: int = -height/2
@onready var selected_indicator_sprite: Sprite2D = $SelectedCardIndicator
@onready var sprite: Sprite2D = $Sprite
@onready var deck_x = 24 - width/2
@onready var button: Button = $Button

# Sets the card x to the deck x
func _ready() -> void:
	set_global_position(Vector2(deck_x, get_global_rect().position.y))

# Moves card smoothly to a target for a duration
func move_horizontally(new_target: int, duration: float = 0.5) -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position:x", new_target, duration)

# Moves card smoothly to a target for a duration
func move_vertically(new_target: int, duration: float = 0.1) -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position:y", new_target, duration)

func determine_and_set_sprite() -> void:
	var supposed_path := "res://assets/cards/" + card_data.name + ".png"
	if FileAccess.file_exists(supposed_path):
		sprite.texture = load(supposed_path)
		return
	
	var default_sprite_path: String = "res://assets/cards/defaults/" + Data.element2str[card_data.element] + ".png"
	if FileAccess.file_exists(default_sprite_path):
		sprite.texture = load(default_sprite_path)
		return
	
	match card_data.element:
		#Data.ELEMENTS.PYRO:
		#	sprite.texture = load(supposed_path)
		# etc...
		_:
			sprite.texture = load("res://assets/cards/sprite_missing.png")

func play(target: EnemyBody) -> bool:
	var is_played = true	
	if target and card_data.targets_single_enemy():
		pass
	elif not target and not card_data.targets_single_enemy():
		pass
	else:
		is_played = false
		print("Card isn't played")
	
	if is_played:
		card_data.play(target.enemy_data)
		queue_free()
		Game.state.run.battle.hand.erase(card_data)
	
	return is_played

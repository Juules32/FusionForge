extends Control
class_name Card

const deck_x = 20

@onready var width: int = int(size[0])
@onready var height: int = int(size[1])
@onready var y: int = -height/2

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

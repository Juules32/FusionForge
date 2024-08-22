extends Control
class_name Card

const deck_x_position = 20

func _ready() -> void:
	set_global_position(Vector2(deck_x_position, get_global_rect().position.y))

func move(new_target: int) -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position:x", new_target, 0.5)

func move_up(new_target: int) -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position:y", new_target, 0.1)

extends Control
class_name EnemyBody

var data: Enemy
@onready var sprite: Sprite2D = $EnemySprite
@onready var enemy_area: Area2D = $EnemyArea
@onready var selected_indicator_sprite = $SelectedCardIndicator

func set_sprite(enemy_name: String) -> void:
	sprite.texture = load("res://assets/enemies/" + enemy_name + ".png")

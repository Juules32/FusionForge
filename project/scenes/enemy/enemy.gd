extends Control
class_name EnemyBody

var data: Enemy
@onready var enemy_sprite: Sprite2D = $EnemySprite
@onready var enemy_area: Area2D = $EnemyArea


func set_sprite(enemy_name: String) -> void:
	enemy_sprite.texture = load("res://assets/enemies/" + enemy_name + ".png")

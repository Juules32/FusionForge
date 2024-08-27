extends Control
class_name EnemyBody

var enemy_data: Enemy = Enemy.new()
@onready var enemy_sprite: Sprite2D = $EnemyArea/EnemySprite

func set_sprite(enemy_name: String) -> void:
	enemy_sprite.texture = load("res://assets/enemies/" + enemy_name + ".png")

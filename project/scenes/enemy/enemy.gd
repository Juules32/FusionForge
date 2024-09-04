extends Control
class_name EnemyBody

var enemy_data: Enemy
@onready var enemy_sprite: Sprite2D = $EnemySprite
@onready var enemy_area: Area2D = $EnemyArea
@onready var hit_points_label: Label = $HitPointsLabel
@onready var hit_points_bar: ColorRect = $HitPointsBar

const hit_points_bar_width := 32

func set_sprite(enemy_name: String) -> void:
	enemy_sprite.texture = load("res://assets/enemies/" + enemy_name + ".png")

func _process(_delta: float) -> void:
	if enemy_data:
		var percent := float(enemy_data.current_health) / enemy_data.max_health
		hit_points_bar.size.x = percent * hit_points_bar_width
		hit_points_label.text = str(enemy_data.current_health)

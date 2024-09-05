extends Control

@onready var creature_data: Creature = $"..".data
@onready var hit_points_label: Label = $HitPointsLabel
@onready var hit_points_bar: ColorRect = $HitPointsBar

const hit_points_bar_width := 32

func _process(_delta: float) -> void:
	if creature_data:
		var percent: float = float(creature_data.current_health) / creature_data.max_health
		hit_points_bar.size.x = percent * hit_points_bar_width
		hit_points_label.text = str(creature_data.current_health)

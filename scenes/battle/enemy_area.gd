extends HBoxContainer

const enemy_scene = preload("res://scenes/enemy/enemy.tscn")

func _ready() -> void:
	for enemy_data in Game.state.run.battle.enemies:
		setup_enemy(enemy_data)

func setup_enemy(enemy_data: Enemy) -> void:
	var new_enemy: EnemyBody = enemy_scene.instantiate()
	add_child(new_enemy)
	# Sprite is set after adding as child because sprite node inits onready
	new_enemy.set_sprite(enemy_data.name)

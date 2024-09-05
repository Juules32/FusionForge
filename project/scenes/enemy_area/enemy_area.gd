extends HBoxContainer
class_name EnemyArea

const enemy_scene = preload("res://scenes/enemy/enemy.tscn")
var selected_enemy: EnemyBody

func _ready() -> void:
	for enemy_data in Game.state.run.battle.enemies:
		setup_enemy(enemy_data)

func setup_enemy(enemy_data: Enemy) -> void:
	var new_enemy: EnemyBody = enemy_scene.instantiate()
	new_enemy.data = enemy_data
	add_child(new_enemy)
	# Sprite is set after adding as child because sprite node inits onready
	new_enemy.set_sprite(enemy_data.name)
	new_enemy.enemy_area.mouse_entered.connect(_on_enemy_area_mouse_entered.bind(new_enemy))
	new_enemy.enemy_area.mouse_exited.connect(_on_enemy_area_mouse_exited.bind(new_enemy))

func _on_enemy_area_mouse_entered(enemy: EnemyBody) -> void:
	selected_enemy = enemy

func _on_enemy_area_mouse_exited(enemy: EnemyBody) -> void:
	if selected_enemy == enemy:
		selected_enemy = null

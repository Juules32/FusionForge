extends HBoxContainer
class_name EnemyArea

@export var enemy_scene: PackedScene
var selected_enemy: EnemyBody

func _ready() -> void:
	for enemy_data in Game.state.run.battle.enemies:
		setup_enemy(enemy_data)

func _process(_delta: float) -> void:
	_update_selected_indicator_visibility()
	
func _update_selected_indicator_visibility() -> void:
	for enemy: EnemyBody in get_children():
		enemy.selected_indicator_sprite.visible = (enemy == selected_enemy)

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

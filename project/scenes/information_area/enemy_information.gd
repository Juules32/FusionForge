extends VBoxContainer

@onready var enemy_area: EnemyArea = $"../../BattleArea/EnemyCenterer/EnemyArea"
@onready var enemy_name_label: Label = $EnemyNameLabel
@onready var enemy_texture: TextureRect = $EnemyTexture
@onready var enemy_description: RichTextLabel = $EnemyDescription

func _process(delta: float) -> void:
	if not enemy_area.selected_enemy:
		enemy_description.text = "No enemy selected."
		return
	
	enemy_name_label.text = enemy_area.selected_enemy.data.name.capitalize()
	enemy_texture.texture = enemy_area.selected_enemy.sprite.texture
	enemy_description.text = "This enemy intends to ... \nHe's just a cool guy. \n"

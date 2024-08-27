extends Control

var enemy_data: Enemy = Enemy.new()

@export var sprite_texture: Texture2D
@onready var enemy_sprite: Sprite2D = $EnemyArea/EnemySprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_sprite.texture = sprite_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

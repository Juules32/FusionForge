extends Control

@onready var data: Player
@onready var health_component: Control = $HealthComponent

func _ready() -> void:
	# Need to set creature_data again since parent loads after child
	health_component.creature_data = Game.state.run.battle.player

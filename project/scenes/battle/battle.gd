extends Control

func _ready() -> void:
	DisplayServer.window_set_mode(Game.state.options.window_mode)
